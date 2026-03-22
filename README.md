# 🌤️ Atmos

An elegant **iOS Weather App** built with **SwiftUI**, **CoreLocation**, and a **Weather API**.
Smooth animations, location-based weather, and a sleek onboarding experience.

--- 

## 📹 Demo 

  [Demo](https://github.com/user-attachments/assets/11254264-3a23-45e3-94c3-ebbee40f2eb9)

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

– Xcode 16+
– iOS 18.5+
– Swift 5
– OpenWeather API key
– Location permission enabled

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
