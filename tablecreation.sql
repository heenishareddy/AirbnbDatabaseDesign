-- User table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL,
    FName VARCHAR(100) NOT NULL,
    LName VARCHAR(100),
    DOB DATE,
    Address VARCHAR(255)
);

-- Host table
CREATE TABLE Host (
    HostID INT PRIMARY KEY,
    ContactDetails VARCHAR(255),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Property table
CREATE TABLE Property (
    PropertyID INT PRIMARY KEY,
    PropertyType VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    ContactDetails VARCHAR(255),
    HostID INT,
    FOREIGN KEY (HostID) REFERENCES Host(HostID)
);

-- Booking table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    NumberOfGuests INT NOT NULL,
    RoomType VARCHAR(100) NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    CustomerID INT,
    PropertyID INT,
    FOREIGN KEY (CustomerID) REFERENCES User(UserID),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);

-- Experience table
CREATE TABLE Experience (
    ExperienceID INT PRIMARY KEY,
    PropertyID INT,
    Comments TEXT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);

-- Review table
CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    Comments TEXT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    BookingID INT,
    PropertyID INT,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);

-- Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Credentials VARCHAR(255) NOT NULL
);

-- LogsIn table
CREATE TABLE LogsIn (
    EmployeeID INT,
    BookingID INT,
    PRIMARY KEY (EmployeeID, BookingID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

-- Payment table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    PaymentReceived DECIMAL(10, 2) NOT NULL,
    BookingID INT,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

-- Restaurant table
CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY,
    Cuisines VARCHAR(255),
    OutdoorSeating BOOLEAN DEFAULT FALSE,
    AlcoholServed BOOLEAN DEFAULT FALSE,
    SmokingZone BOOLEAN DEFAULT FALSE,
    PropertyID INT,
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);

-- Availability table
CREATE TABLE Availability (
    AvailabilityID INT PRIMARY KEY,
    RoomType VARCHAR(100),
    CheckInDate DATE,
    PropertyID INT,
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);
