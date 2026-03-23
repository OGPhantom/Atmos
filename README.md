# 🌤️ Atmos

An elegant **iOS Weather App** built with **SwiftUI**, **CoreLocation**, and a **Weather API**.
Smooth animations, location-based weather, and a sleek onboarding experience.

--- 

## 📹 Demo 

  [Demo](https://github.com/user-attachments/assets/4c60567c-169b-4021-96c0-3c0b2d5acd18)

--- 

## 📸 Screenshots 

<p align="center"> 
  <img width="568" height="1084" alt="Screenshot 2026-03-23 at 12 24 58" src="https://github.com/user-attachments/assets/e5927e3c-64fc-4b1d-a734-6b4612f6cab7" />
  <img width="568" height="1084" alt="Screenshot 2026-03-23 at 12 25 21" src="https://github.com/user-attachments/assets/37672887-a725-4b0a-8659-7c5ed30535ec" />
</p>

--- 
## ✨ Features

* 📍 Get local weather using **CoreLocation**
* 🌦️ Real-time weather data via **Weather API**
* 🎬 Smooth onboarding flow with custom transitions
* 📱 Beautiful animated UI (welcome, loading, and forecast screens)
* 🎨 Modern SwiftUI layout with component-based architecture
* 🧊 Support for feels-like temperature, humidity, wind speed, and more

---

## 🛠️ Tech Stack

* **SwiftUI**
* **CoreLocation**
* **OpenWeatherMap API (or your weather API)**
* **MVVM Architecture**
* **Async/Await for networking**

---

## 📄 Requirements

- Xcode 15+
- iOS 18+
- Swift 5
- OpenWeather API key
- Location permission enabled

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
