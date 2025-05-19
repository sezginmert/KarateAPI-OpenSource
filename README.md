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


## ☕ Java Version

- Java 11 (Recommended: [Eclipse Temurin 11](https://adoptium.net/en-GB/temurin/releases/?version=11))

## 📁 Project Structure

```
📁 KarateFramework  
├── .idea  
├── src  
│   ├── main  
│   │   ├── java  
│   │   ├── resources  
│   ├── test  
│   │   ├── java  
│   │   │   ├── callers  
│   │   │   ├── data  
│   │   │   ├── feature  
│   │   │   ├── performanceRunners  
│   │   │   ├── testRunner  
│   │   │   ├── utilities  
│   │   ├── karate-config.js  
│   │   ├── logback-test.xml  
├── target  
├── .gitignore  
├── pom.xml  
├── External Libraries  
├── Scratches and Consoles  
