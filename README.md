# Karate API Test Automation Project

This project is an API test automation suite built with [Karate Framework](https://karatelabs.io/). It includes various `GET`, `POST`, `PATCH`, and `DELETE` request tests against multiple public APIs.

## 🌐 APIs Used

- **Pet Store API** – `https://petstore.swagger.io/v2/`
- **Another Host API** – `https://another-host.com/v1/`
- **Restful Booker API** – `https://restful-booker.herokuapp.com/`
- **Fuel Prices API (CollectAPI)** – `https://api.collectapi.com/`
- **Pharmacy API (CollectAPI)** – `https://api.collectapi.com/`
- **Gold & Stock Market API (CollectAPI)** – `https://api.collectapi.com/`

## ✅ Features

- End-to-end API testing with Karate DSL
- Covers positive and negative test cases
- Uses external data sources (JSON, CSV, JS)
- Organized folder structure for maintainability
- Easily extensible and CI/CD compatible

## ☕ Java Version

- Java 11 (Recommended: [Eclipse Temurin 11](https://adoptium.net/en-GB/temurin/releases/?version=11))

## 📁 Project Structure

```
├── .idea # IntelliJ project settings
├── src
│ ├── main
│ │ ├── java # (empty or support classes if needed)
│ │ ├── resources # application configs (if needed)
│ ├── test
│ │ ├── java
│ │ │ ├── callers # Feature files triggering reusable tests
│ │ │ │ ├── demo.feature
│ │ │ ├── data # Test data files
│ │ │ │ ├── createBooking.json
│ │ │ │ ├── examples.csv
│ │ │ │ ├── generate.js
│ │ │ │ ├── postUser.json
│ │ │ ├── feature # Main test features grouped by purpose
│ │ │ │ ├── GET_goldCurrencyAndStockMarketAPI.feature
│ │ │ │ ├── GET_onDutyPharmacyAPI.feature
│ │ │ │ ├── GET_turkeyDieselPriceAPI.feature
│ │ │ │ ├── PetStoreGET.feature
│ │ │ │ ├── PetStorePOST.feature
│ │ │ │ ├── POST_CreateBookingAPI.feature
│ │ │ │ ├── POST_operationsAboutUserAPI.feature
│ │ │ │ ├── practiseDay.feature
│ │ │ │ ├── resffulgasd.feature
│ │ │ ├── performanceRunners # For load/performance test runners
│ │ │ ├── testRunner # Karate config files and test runners
│ │ │ │ ├── karate-config.js
│ │ │ │ ├── logback-test.xml
├── target # Compiled test output and reports
├── .gitignore
├── pom.xml # Maven build file
