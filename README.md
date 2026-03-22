# 🌤️ Atmos

An elegant **iOS Weather App** built with **SwiftUI**, **CoreLocation**, and a **Weather API**.
Smooth animations, location-based weather, and a sleek onboarding experience.

---

## ✨ Features

* 📍 Get local weather using **CoreLocation**
* 🌦️ Real-time weather data via **Weather API**
* 🎬 Smooth onboarding flow with custom transitions
* 📱 Beautiful animated UI (welcome, loading, and forecast screens)
* 🎨 Modern SwiftUI layout with component-based architecture
* 🧊 Support for feels-like temperature, humidity, wind speed, and more

---

## 📸 Screenshots

<p align="center">
  <img width="341" height="684" alt="Screenshot 2025-10-13 at 23 47 19" src="https://github.com/user-attachments/assets/12abfeb1-9208-408d-9ec4-a17f2880ba06" />
  <img width="347" height="687" alt="Screenshot 2025-10-13 at 23 48 14" src="https://github.com/user-attachments/assets/904e51ed-b48d-4f6e-8687-9e8b6aac1270" />
</p>
<p align="center">
  <img width="346" height="678" alt="Screenshot 2025-10-13 at 23 47 50" src="https://github.com/user-attachments/assets/b1a4b13f-4a99-46a3-9801-26edbe3b0ef1" />
  <img width="346" height="686" alt="Screenshot 2025-10-13 at 23 47 59" src="https://github.com/user-attachments/assets/ce6414ec-1cf5-4869-92d2-cc8be765c42d" />
</p>

---

## 🛠️ Tech Stack

* **SwiftUI**
* **CoreLocation**
* **OpenWeatherMap API (or your weather API)**
* **MVVM Architecture**
* **Async/Await for networking**

---

## 🚀 Installation

1. Clone the repository:
   * git clone https://github.com/OGPhantom/WeatherAppSwiftUI.git
   * cd WeatherAppSwiftUI

2. Open the project in **Xcode**

3. Add your API key:

   * Create a `Secrets.xcconfig` file (excluded from Git):
     WEATHER_API_KEY=your_api_key_here
   * Make sure it's included in build settings (`Swift Compiler > Custom Flags > Other Swift Flags`):
     -DAPI_KEY=$(WEATHER_API_KEY)

4. Run the app on a simulator or real device

   > ⚠️ Don’t forget to allow **location access** on first launch
