# Web Scraper

#### _Scrapes specified website to look for code samples_

#### By _**Andrew, Kevin, Ian, John**_

## Description

_{This is a detailed description of your application. Its purpose and usage.  Give as much detail as needed to explain what the application does, and any other information you want users or other developers to have. }_

## Setup/Installation Requirements

1. Download ZIP folder
2. Extract ZIP folder
3. Install Git Bash, JDK, Gradle, PSQL
4. Paste into your CLI:
```
  PSQL
  CREATE DATABASE program_languages;
  \c program_languages;
  CREATE TABLE careers (id int PRIMARY KEY, title varchar, description varchar);
  CREATE TABLE languages (id int PRIMARY KEY, title varchar, description varchar);
  CREATE DATABASE program_languages_test WITH TEMPLATE program_languages;
```
5. In Git Bash, navigate to
6. Type "gradle run"
7. Go to localhost:4567 in your web browser

## Known Bugs

_{Are there issues that have not yet been resolved that you want to let users know you know?  Outline any issues that would impact use of your application.  Share any workarounds that are in place. }_

## Support and contact details

John -
Ian Lesikar - ilesikar@gmail.com
Kevin -
Andrew -

_Contact any of us if you have and questions_

## Technologies Used

* [Atom](https://atom.io/)
* [Sublime Text](https://www.sublimetext.com/)
* [Bootstrap](http://getbootstrap.com/)
* [Spark Framework](http://sparkjava.com/)
* [Java SE JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* [Gradle](https://gradle.org/)
* [Apache Velocity](https://velocity.apache.org/engine/releases/velocity-1.5/index.html)
* [Dillinger](http://dillinger.io/)
* [PSQL](http://www.postgresql.org/)

### License

The MIT License (MIT) Copyright (c) 2016 Epicodus
