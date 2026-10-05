# My Management

## 📌 Description

Designed as an interactive hub for personal productivity and routine management, this application enables users to organize daily agendas, track mood patterns through visual analytics, and systematically resolve recurring challenges using a structured knowledge base. Integrated with an AI assistant for real-time guidance, the platform provides a seamless environment to manage personal commitments, gain actionable insights into emotional trends, and optimize everyday workflows.

---

## 🛠️ Tech Stack

| Category                    | Technologies Used                                                                                                                                                                      |
| :-------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 🌐 **Programming Language** | `Dart`                                                                                                                                                                                 |
| 🧩 **Framework**            | `Flutter`                                                                                                                                                                              |
| ⚛️ **Libraries**            | `flutter_dotenv`, `http`, `d_session`, `fd_log`, `GetX`, `intl`, `Gap`,<br>`fluttertoast`, `D'Info`, `d_chart`, `Calendar View`, `Image Picker`,<br>`Flutter Markdown`, `google_fonts` |
| 🤖 **Generative AI Model**  | `Google Gemini`                                                                                                                                                                        |
| 👾 **IDE**                  | `Android Studio`                                                                                                                                                                       |

---

## ⚙️ Setup Instructions

1. **Prerequisites**
   - Flutter SDK (Version 3.4x) installed on your system.
   - JDK 21 (Eclipse Temurin) installed on your system.
   - Git installed on your system.
   - Android Studio IDE with the following SDK components installed:
     - Android SDK (Android 16.0 / API Level 36)
     - Android SDK Build-Tools (Versions 28 & 36)
     - NDK (Version 28)
     - Android SDK Command-line Tools
     - Android Emulator
     - Android SDK Platform-Tools
   - A running backend API server.
   - An active [Google AI Studio](https://aistudio.google.com) account and API Key.

2. **Google AI API Key Setup**
   - Visit the official [Google AI Studio](https://aistudio.google.com) website.
   - Navigate to the **Dashboard** menu on the sidebar, then select **API Keys**.
   - Click **Create API key**, enter a name for your key and project, then click **Create key**.
   - Copy the generated **API Key** value to use during environment configuration.

3. **Clone the Repository**

```bash
git clone https://github.com/Fikri-Rouzan/my_management.git
cd my_management
```

4. **Install Packages**

```bash
flutter pub get
```

5. **Configure Environment Variables**

```bash
cp .env.example .env
```

- Open the `.env` file and configure the following variables

  ```env
  BASE_URL="YOUR_BASE_URL"
  GOOGLE_AI_API_KEY="YOUR_GOOGLE_AI_API_KEY"
  ```
