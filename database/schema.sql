-- ==========================================
-- DATABASE CREATION
-- ==========================================

CREATE DATABASE VisionAssistDB;

USE VisionAssistDB;

-- ==========================================
-- USERS TABLE
-- ==========================================

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- OBJECT DETECTION TABLE
-- ==========================================

CREATE TABLE DetectedObjects (
    ObjectID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ObjectName VARCHAR(100),
    ConfidenceScore DECIMAL(5,2),
    DetectedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

-- ==========================================
-- OCR TEXT RECOGNITION TABLE
-- ==========================================

CREATE TABLE OCRResults (
    OCRID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    DetectedText TEXT,
    CaptureTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

-- ==========================================
-- OBSTACLE DETECTION TABLE
-- ==========================================

CREATE TABLE Obstacles (
    ObstacleID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ObstacleType VARCHAR(100),
    DistanceMeters DECIMAL(6,2),
    AlertLevel VARCHAR(20),
    DetectionTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

-- ==========================================
-- LOCATION HISTORY TABLE
-- ==========================================

CREATE TABLE LocationHistory (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Latitude DECIMAL(10,8),
    Longitude DECIMAL(11,8),
    LocationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

-- ==========================================
-- NAVIGATION ROUTES TABLE
-- ==========================================

CREATE TABLE NavigationRoutes (
    RouteID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    SourceLocation VARCHAR(255),
    DestinationLocation VARCHAR(255),
    RouteStatus VARCHAR(50),
    StartTime DATETIME,
    EndTime DATETIME,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

-- ==========================================
-- VOICE COMMANDS TABLE
-- ==========================================

CREATE TABLE VoiceCommands (
    CommandID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    CommandText VARCHAR(255),
    CommandTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

-- ==========================================
-- EMERGENCY ALERTS TABLE
-- ===============================
