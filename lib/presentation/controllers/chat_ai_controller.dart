import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:my_management/common/constants.dart';
import 'package:my_management/common/logging.dart';
import 'package:my_management/data/models/item_chat_model.dart';

class ChatAIController extends GetxController {
  final _list = <ItemChatModel>[].obs;
  List<ItemChatModel> get list => _list;

  final _loading = false.obs;
  bool get loading => _loading.value;

  final _image = XFile('').obs;
  XFile get image => _image.value;
  bool get noImage => image.path == '';

  pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage == null) return;

    _image.value = pickedImage;
  }

  setupModel() {}

  Future<String?> sendMessage(String messageFromUser) async {
    _loading.value = true;

    try {
      Image? imageSelected = noImage
          ? null
          : Image.file(File(image.path), fit: BoxFit.fitHeight);

      final itemChatUser = ItemChatModel(
        image: imageSelected,
        text: messageFromUser,
        fromUser: true,
      );

      _list.add(itemChatUser);

      final url = Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-3.8-flash:generateContent?key=${Constants.googleAIAPIKey}',
      );

      final List<Map<String, dynamic>> contents = [];

      for (var item in _list) {
        if (item.text != null && item.text!.isNotEmpty) {
          contents.add({
            'role': item.fromUser ? 'user' : 'model',
            'parts': [
              {'text': item.text},
            ],
          });
        }
      }

      if (!noImage) {
        Uint8List bytes = await image.readAsBytes();
        String base64Image = base64Encode(bytes);

        contents.last['parts'] = [
          {'text': messageFromUser},
          {
            'inline_data': {
              'mime_type': image.mimeType ?? 'image/jpeg',
              'data': base64Image,
            },
          },
        ];
      }

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'contents': contents}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final messageFromAI =
            data['candidates']?[0]?['content']?['parts']?[0]?['text']
                as String?;

        if (messageFromAI != null) {
          final itemChatAI = ItemChatModel(
            image: null,
            text: messageFromAI,
            fromUser: false,
          );

          _list.add(itemChatAI);
          return messageFromAI;
        }
      }

      fdLog.title(
        'Chat AI Controller - sendMessage',
        'Status ${response.statusCode}: ${response.body}',
      );
      return null;
    } catch (e) {
      fdLog.title('Chat AI Controller - sendMessage', e.toString());
      return null;
    } finally {
      _loading.value = false;
      _image.value = XFile('');
    }
  }

  static delete() {
    Get.delete<ChatAIController>(force: true);
  }
}
