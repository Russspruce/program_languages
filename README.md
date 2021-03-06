# Programming Languages Database

#### _A database of programming languages, their uses, and the careers they make possible. 5/20/2016_

#### By _**Andrew, Kevin, Ian, John**_

## Description

Website that contains information on programming languages.

## Setup/Installation Requirements

* Download ZIP folder
* Extract ZIP folder
* Install Git Bash, JDK, Gradle, PSQL
* Paste into your CLI:

```sql
PSQL
CREATE DATABASE program_languages;
\c program_languages;
CREATE TABLE languages (id serial PRIMARY KEY, name varchar, description varchar, example varchar, date varchar, most_recent_release_date varchar, webpage varchar);
CREATE TABLE careers (id serial PRIMARY KEY, title varchar, description varchar);
CREATE TABLE programs (id serial PRIMARY KEY, name varchar, description varchar, url varchar);
CREATE TABLE types (id serial PRIMARY KEY, name varchar, description varchar);
CREATE TABLE languages_careers (id serial PRIMARY KEY, language_id int, career_id int);
CREATE TABLE languages_programs (id serial PRIMARY KEY, language_id int, program_id int);
CREATE TABLE languages_types (id serial PRIMARY KEY, language_id int, type_id int);
CREATE DATABASE program_languages_test WITH TEMPLATE program_languages;
```

* In Git Bash, navigate to program_languages
* Type "gradle run"
* Go to localhost:4567 in your web browser

## Known Bugs


## Support and contact details

John -

Ian Lesikar - ilesikar@gmail.com

Kevin -

Andrew - russspruce@gmail.com

_Contact any of us if you have questions._

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
