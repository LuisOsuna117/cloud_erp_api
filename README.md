# 👋 Welcome to **cloud_erp_api** 🍕
REST API for Cloud ERP app developed in Flutter
![Version](https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000)
[![Documentation](https://img.shields.io/badge/documentation-yes-brightgreen.svg)](.)
[![License: # Apache](https://img.shields.io/badge/license-GNU%20AGPLv3-green)](https://www.gnu.org/licenses/agpl-3.0.en.htm)

> Foodery is an on-demand delivery app that promises to be the best solution for students to get food in school

## ✨ [Production Website](.)

## Install

``` sh
git clone URL_PROJECT && cd foodery-back-end
npm install
```

This guide will help the internal team to connect Foodery back-end serves web and mobile apps.

It is necessary to have a `config.env` file that provides the necessary keys and ports for the project to work. Request access to the project manager. The file must be allocated as follows `./src/config/config.env` .

## Usage

Running the project for development

``` sh

# Run MongoDB

mongod --dbpath ~/.mongodb/ --port 3001 --quiet

# Run NodeJS

npm run dev
```

## Run tests

Running global tests

``` sh
npm run test
```

## Built With

* Framework
  + [NodeJS](https://nodejs.org/) - JavaScript runtime environment
  + [ExpressJS](https://expressjs.com/) - Minimalist web framework for Node.js
* Database
  + [MySQL](https://www.mysql.com/) - An open-source relational database management system.

## Author
👤 **José Luis Moreno | @LuisOsuna117**

## 🤝 Contributing

Contributions, issues and feature requests must follow the following points

* All code must be written in english (classes, comments, variable names, etc.) not including the names of the components
* Avoid using `this_type_of_variable_names` and `useCamelCase` .
* This repository follows [Airbnb JavaScript Coding Style](https://github.com/airbnb/javascript). Feel free to look at the [eslint installation guide](https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb)

## 📝 License

2020 [Blith]().

This project is [GNU AGPLv3](https://www.gnu.org/licenses/agpl-3.0.en.htm) licensed. See the [LICENSE](./LICENSE.md) file for details.

