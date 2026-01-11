CREATE DATABASE country_analysis;

USE country_analysis;

CREATE TABLE continent (
    continentId INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE country (
    countryId INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    continentId INT,
    superficie BIGINT,
    codeIso CHAR(2) UNIQUE,
    FOREIGN KEY (continentId) REFERENCES continent(continentId)
);


CREATE TABLE metrics (
  metricId INT PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);

CREATE TABLE country_metrics (
  metricId INT,
  countryId INT,
  metricYear YEAR,
  metricValue DECIMAL(15,2),
  PRIMARY KEY(metricId, countryId, metricYear),
  FOREIGN KEY (metricId) REFERENCES metrics(metricId),
  FOREIGN KEY (countryId) REFERENCES country(countryId)
);
