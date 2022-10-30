SET DEFINE OFF  

CREATE TABLE Users(
id VARCHAR2(5),
email VARCHAR2(320) NOT NULL,
first_name VARCHAR2(20) NOT NULL,
last_name VARCHAR2(20) NOT NULL,
birthdate DATE NOT NULL,
birthplace CHAR(2) NOT NULL,
gender CHAR(1) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Friends(
user_id VARCHAR2(5) NOT NULL,
friend_id VARCHAR2(5) NOT NULL,
    PRIMARY KEY(user_id, friend_id),
    FOREIGN KEY(user_id) REFERENCES Users(id),
    FOREIGN KEY(friend_id) REFERENCES Users(id)
    ON DELETE CASCADE
);

CREATE TABLE Complimented(
user_id VARCHAR2(5) NOT NULL,
friend_id VARCHAR2(5) NOT NULL,
    PRIMARY KEY(user_id, friend_id),
    FOREIGN KEY(user_id) REFERENCES Users(id),
    FOREIGN KEY(friend_id) REFERENCES Users(id)
    ON DELETE CASCADE
);

CREATE TABLE Categories(
id VARCHAR2(5),
name VARCHAR2(20) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Businesses(
id VARCHAR2(5),
business_name VARCHAR2(30) NOT NULL,
operation_days VARCHAR2(50) NOT NULL,
ambient_type VARCHAR2(10),
street VARCHAR2(50) NOT NULL, 
address_state CHAR(2) NOT NULL,
zipcode CHAR(5),
category_type VARCHAR2(5) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(category_type) REFERENCES Categories(id)
    ON DELETE CASCADE
);

CREATE TABLE User_checkin(
user_id VARCHAR2(5) NOT NULL,
business_id VARCHAR2(5) NOT NULL,
    PRIMARY KEY(user_id, business_id),
    FOREIGN KEY(user_id) REFERENCES Users(id),
    FOREIGN KEY(business_id) REFERENCES Businesses(id)
    ON DELETE CASCADE
);

CREATE TABLE Reviews(
id VARCHAR2(5),
stars INTEGER NOT NULL,
author VARCHAR2(5) NOT NULL,
publish_date VARCHAR2(30) NOT NULL,
business_id VARCHAR(5) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(author) REFERENCES Users(id),
    FOREIGN KEY(business_id) REFERENCES Businesses(id)
    ON DELETE CASCADE
);

CREATE TABLE Comments(
review_id VARCHAR2(5) NOT NULL,
author VARCHAR2(5) NOT NULL,
    PRIMARY KEY(review_id, author),
    FOREIGN KEY(review_id) REFERENCES Reviews(id),
    FOREIGN KEY(author) REFERENCES Users(id)
    ON DELETE CASCADE
);

CREATE TABLE Subcategories(
category_id VARCHAR2(5) NOT NULL,
name VARCHAR2(50) NOT NULL,
    PRIMARY KEY(category_id, name),
    FOREIGN KEY(category_id) REFERENCES Categories(id)
    ON DELETE CASCADE
);

CREATE TABLE Checkin(
id INTEGER,
info VARCHAR2(30) NOT NULL,
business_id VARCHAR2(5) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(business_id) REFERENCES Businesses(id)
    ON DELETE CASCADE
);

INSERT INTO Users VALUES('Y1', 'john@yahoo.com', 'John', 'Smith', TO_DATE('1992-12-12','YYYY-MM-DD'), 'FL', 'M');
INSERT INTO Users VALUES('Y2', 'juan@gmail.com', 'Juan', 'Carlos', TO_DATE('1988-02-07','YYYY-MM-DD'), 'AK', 'M');
INSERT INTO Users VALUES('Y3', 'Jane@gmail.com', 'Jane', 'Chapel', TO_DATE('1980-06-01','YYYY-MM-DD'), 'IL', 'F');
INSERT INTO Users VALUES('Y4', 'adi@yahoo.com', 'Aditya', 'Awasthi', TO_DATE('1994-04-12','YYYY-MM-DD'), 'CA', 'M');
INSERT INTO Users VALUES('Y5', 'james@hotmail.com', 'James', 'Williams', TO_DATE('1991-05-05','YYYY-MM-DD'), 'NY', 'M');
INSERT INTO Users VALUES('Y6', 'mike@yahoo.com', 'Mike', 'Brown', TO_DATE('1988-03-01','YYYY-MM-DD'), 'NC', 'M');
INSERT INTO Users VALUES('Y7', 'bob@gmail.com', 'Bob', 'Jones', TO_DATE('1970-02-19','YYYY-MM-DD'), 'NY', 'M');
INSERT INTO Users VALUES('Y8', 'wei@yahoo.com', 'Wei', 'Zhang', TO_DATE('1975-03-18','YYYY-MM-DD'), 'NV', 'F');
INSERT INTO Users VALUES('Y9', 'mark@yahoo.com', 'Mark', 'Davis', TO_DATE('1993-11-02','YYYY-MM-DD'), 'CA', 'M');
INSERT INTO Users VALUES('Y10', 'daniel@yahoo.com', 'Daniel', 'Garcia', TO_DATE('1984-05-10','YYYY-MM-DD'), 'NJ', 'M');
INSERT INTO Users VALUES('Y11', 'maria@yahoo.com', 'Maria', 'Rodriguez', TO_DATE('1985-08-12','YYYY-MM-DD'), 'CA', 'F');
INSERT INTO Users VALUES('Y12', 'freya@yahoo.com', 'Freya', 'Wilson', TO_DATE('1995-10-05','YYYY-MM-DD'), 'NJ', 'F');

INSERT INTO Friends VALUES('Y1', 'Y2');
INSERT INTO Friends VALUES('Y1', 'Y7');
INSERT INTO Friends VALUES('Y1', 'Y9');
INSERT INTO Friends VALUES('Y3', 'Y6');
INSERT INTO Friends VALUES('Y3', 'Y11');
INSERT INTO Friends VALUES('Y3', 'Y5');
INSERT INTO Friends VALUES('Y4', 'Y7');
INSERT INTO Friends VALUES('Y4', 'Y11');
INSERT INTO Friends VALUES('Y6', 'Y2');
INSERT INTO Friends VALUES('Y6', 'Y4');
INSERT INTO Friends VALUES('Y7', 'Y1');
INSERT INTO Friends VALUES('Y7', 'Y3');
INSERT INTO Friends VALUES('Y8', 'Y6');
INSERT INTO Friends VALUES('Y8', 'Y1');
INSERT INTO Friends VALUES('Y9', 'Y1');
INSERT INTO Friends VALUES('Y9', 'Y2');
INSERT INTO Friends VALUES('Y11', 'Y3');
INSERT INTO Friends VALUES('Y11', 'Y5');
INSERT INTO Friends VALUES('Y12', 'Y11');

INSERT INTO Complimented VALUES('Y1', 'Y7');
INSERT INTO Complimented VALUES('Y1', 'Y9');
INSERT INTO Complimented VALUES('Y3', 'Y6');
INSERT INTO Complimented VALUES('Y4', 'Y11');
INSERT INTO Complimented VALUES('Y6', 'Y4');
INSERT INTO Complimented VALUES('Y7', 'Y3');
INSERT INTO Complimented VALUES('Y8', 'Y6');
INSERT INTO Complimented VALUES('Y9', 'Y2');
INSERT INTO Complimented VALUES('Y11', 'Y5');
INSERT INTO Complimented VALUES('Y12', 'Y11');

INSERT INTO Categories VALUES('BCT1', 'Amusement Parks');
INSERT INTO Categories VALUES('BCT2', 'National Parks');
INSERT INTO Categories VALUES('BCT3', 'Career Counseling');
INSERT INTO Categories VALUES('BCT4', 'Food and More');
INSERT INTO Categories VALUES('BCT5', 'Bars');
INSERT INTO Categories VALUES('BCT6', 'Restaurents');
INSERT INTO Categories VALUES('BCT7', 'Pool Cleaners');
INSERT INTO Categories VALUES('BCT8', 'Coffee Shops');

INSERT INTO Subcategories VALUES('BCT1', 'Water Parks');
INSERT INTO Subcategories VALUES('BCT2', 'Wildlife National Parks');
INSERT INTO Subcategories VALUES('BCT3', 'Career Counselling for kids');
INSERT INTO Subcategories VALUES('BCT4', 'Ice-cream and Yougurt');
INSERT INTO Subcategories VALUES('BCT5', 'Sports bar');
INSERT INTO Subcategories VALUES('BCT6', 'Ice-cream and Yougurt');
INSERT INTO Subcategories VALUES('BCT7', 'Swimming pool cleaners');
INSERT INTO Subcategories VALUES('BCT8', 'Cold coffee shops');

INSERT INTO Businesses VALUES('B1', 'Big Surf', 'Mon, Tue, Wed', 'Touristy', '1500 N McClintock Dr, Tempe', 'AZ', '85281', 'BCT1');
INSERT INTO Businesses VALUES('B2', 'SMITH THOMSON', 'Mon, Tue, Wed, Thu', 'Touristy', '1595 Spring Hill Road Suite 110 Vienna', 'VA', '22182', 'BCT6');
INSERT INTO Businesses VALUES('B3', 'Bay Area Coffee Shop', 'Mon, Tue, Wed', 'Touristy', '1522 W. Sam Rayburn Dr. Bonham', 'CA', '95051', 'BCT8');
INSERT INTO Businesses VALUES('B4', 'China Coffee Toffee', 'Mon, Tue, Wed', 'Touristy', '2570 El Camino Real, Santa Clara', 'CA', '95051', 'BCT4');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, zipcode, category_type) VALUES('B5', 'Hastings Water Works', 'Mon, Tue, Wed', '10331 Brecksville Rd. Brecksville', 'OH', '44141', 'BCT7');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, zipcode, category_type) VALUES('B6', 'Catch Your Big Break', 'Mon, Tue, Wed, Thu, Fri, Sat, Sun', '2341 Roosevelt Ct Santa Clara', 'CA', '95051', 'BCT3');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, zipcode, category_type) VALUES('B7', 'The Cinebar', 'Mon, Tue, Wed, Thu', '20285 South Western Ave., Suite # 200, Torrance,', 'CA', '90501', 'BCT5');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, category_type) VALUES('B8', 'Coffee Bar && Bistro', 'Mon, Tue, Wed', '2585 El Camino Real Santa Clara', 'CA', 'BCT5');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, zipcode, category_type) VALUES('B9', 'Hobee''s', 'Mon, Tue, Wed, Thu, Fri', '90 Skyport Dr San Jose', 'CA', '95110', 'BCT6');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, zipcode, category_type) VALUES('B10', 'Cafe Gourmet', 'Mon, Tue', '80 N Market St San Jose', 'CA', '95113', 'BCT6');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, zipcode, category_type) VALUES('B11', 'Yellow Stone National Park', 'Mon, Fri, Sat, Sun', 'Yellow Stone National Park', 'WY', '82190', 'BCT2');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, zipcode, category_type) VALUES('B12', 'Petrified Forest National Park', 'Mon, Tue, Sun', 'P.O. Box 221', 'AZ', '86028', 'BCT2');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, zipcode, category_type) VALUES('B13', 'Grand Canyon National park', 'Mon, Sat, Sun', 'Highway 64', 'AZ', '86023', 'BCT2');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, zipcode, category_type) VALUES('B35', 'Connecticut Bar', 'Mon, Thu, Sun', '5847 San Felipe, Suite 2400 Houston', 'TX', '77057', 'BCT5');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, zipcode, category_type) VALUES('B36', 'Sherley''s Bar && Restaurent', 'Mon, Wed, Sun', '1132 Terry Road, Hartford', 'CT', '06105', 'BCT5');
INSERT INTO Businesses (id, business_name, operation_days, street, address_state, zipcode, category_type) VALUES('B14', 'Connecticut Bar && Restaurent', 'Mon, Wed, Sun', '1132 Terry Road, Hartford', 'CT', '06105', 'BCT5');

INSERT INTO User_checkin VALUES('Y1', 'B3');
INSERT INTO User_checkin VALUES('Y1', 'B2');
INSERT INTO User_checkin VALUES('Y1', 'B13');
INSERT INTO User_checkin VALUES('Y1', 'B35');
INSERT INTO User_checkin VALUES('Y1', 'B36');
INSERT INTO User_checkin VALUES('Y1', 'B5');
INSERT INTO User_checkin VALUES('Y1', 'B4');
INSERT INTO User_checkin VALUES('Y1', 'B9');

INSERT INTO User_checkin VALUES('Y2', 'B10');
INSERT INTO User_checkin VALUES('Y2', 'B5');
INSERT INTO User_checkin VALUES('Y2', 'B11');
INSERT INTO User_checkin VALUES('Y2', 'B2');
INSERT INTO User_checkin VALUES('Y2', 'B36');
INSERT INTO User_checkin VALUES('Y2', 'B35');

INSERT INTO User_checkin VALUES('Y4', 'B4');
INSERT INTO User_checkin VALUES('Y4', 'B11');
INSERT INTO User_checkin VALUES('Y4', 'B12');
INSERT INTO User_checkin VALUES('Y4', 'B5');
INSERT INTO User_checkin VALUES('Y4', 'B36');
INSERT INTO User_checkin VALUES('Y4', 'B35');
INSERT INTO User_checkin VALUES('Y4', 'B2');

INSERT INTO User_checkin VALUES('Y5', 'B6');
INSERT INTO User_checkin VALUES('Y5', 'B11');
INSERT INTO User_checkin VALUES('Y5', 'B12');
INSERT INTO User_checkin VALUES('Y5', 'B5');
INSERT INTO User_checkin VALUES('Y5', 'B36');
INSERT INTO User_checkin VALUES('Y5', 'B35');
INSERT INTO User_checkin VALUES('Y5', 'B8');

INSERT INTO User_checkin VALUES('Y6', 'B36');
INSERT INTO User_checkin VALUES('Y6', 'B11');
INSERT INTO User_checkin VALUES('Y6', 'B2');
INSERT INTO User_checkin VALUES('Y6', 'B3');
INSERT INTO User_checkin VALUES('Y6', 'B13');

INSERT INTO User_checkin VALUES('Y7', 'B13');
INSERT INTO User_checkin VALUES('Y7', 'B35');
INSERT INTO User_checkin VALUES('Y7', 'B36');
INSERT INTO User_checkin VALUES('Y7', 'B11');
INSERT INTO User_checkin VALUES('Y7', 'B2');
INSERT INTO User_checkin VALUES('Y7', 'B3');

INSERT INTO User_checkin VALUES('Y8', 'B11');
INSERT INTO User_checkin VALUES('Y8', 'B2');
INSERT INTO User_checkin VALUES('Y8', 'B13');
INSERT INTO User_checkin VALUES('Y8', 'B35');
INSERT INTO User_checkin VALUES('Y8', 'B36');
INSERT INTO User_checkin VALUES('Y8', 'B4');

INSERT INTO User_checkin VALUES('Y9', 'B5');
INSERT INTO User_checkin VALUES('Y9', 'B11');
INSERT INTO User_checkin VALUES('Y9', 'B2');
INSERT INTO User_checkin VALUES('Y9', 'B13');
INSERT INTO User_checkin VALUES('Y9', 'B35');
INSERT INTO User_checkin VALUES('Y9', 'B36');

INSERT INTO User_checkin VALUES('Y10', 'B1');
INSERT INTO User_checkin VALUES('Y10', 'B5');
INSERT INTO User_checkin VALUES('Y10', 'B11');
INSERT INTO User_checkin VALUES('Y10', 'B2');
INSERT INTO User_checkin VALUES('Y10', 'B36');
INSERT INTO User_checkin VALUES('Y10', 'B35');
INSERT INTO User_checkin VALUES('Y10', 'B3');

INSERT INTO User_checkin VALUES('Y11', 'B3');
INSERT INTO User_checkin VALUES('Y11', 'B4');
INSERT INTO User_checkin VALUES('Y11', 'B1');
INSERT INTO User_checkin VALUES('Y11', 'B5');
INSERT INTO User_checkin VALUES('Y11', 'B11');
INSERT INTO User_checkin VALUES('Y11', 'B2');
INSERT INTO User_checkin VALUES('Y11', 'B36');
INSERT INTO User_checkin VALUES('Y11', 'B35');

INSERT INTO User_checkin VALUES('Y12', 'B7');
INSERT INTO User_checkin VALUES('Y12', 'B10');
INSERT INTO User_checkin VALUES('Y12', 'B5');
INSERT INTO User_checkin VALUES('Y12', 'B11');
INSERT INTO User_checkin VALUES('Y12', 'B2');
INSERT INTO User_checkin VALUES('Y12', 'B13');
INSERT INTO User_checkin VALUES('Y12', 'B35');
INSERT INTO User_checkin VALUES('Y12', 'B36');

INSERT INTO Reviews VALUES('R1', 3, 'Y11', 'Oct-02-07 09:10:54 PDT', 'B3');
INSERT INTO Reviews VALUES('R2', 2, 'Y10', 'Sep-29-07 13:45:00 PDT', 'B1');
INSERT INTO Reviews VALUES('R3', 4, 'Y2', 'Sep-29-07 10:38:25 PDT', 'B10');
INSERT INTO Reviews VALUES('R4', 5, 'Y11', 'Oct-02-07 13:05:56 PDT', 'B4');
INSERT INTO Reviews VALUES('R5', 5, 'Y1', 'Oct-25-07 17:15:00 PDT ', 'B3');
INSERT INTO Reviews VALUES('R6', 5, 'Y4', 'Sep-26-07 17:15:00 PDT', 'B4');
INSERT INTO Reviews VALUES('R7', 5, 'Y9', 'Sep-26-07 17:15:00 PDT ', 'B5');
INSERT INTO Reviews VALUES('R8', 5, 'Y5', 'Sep-27-07 17:15:00 PDT ', 'B6');
INSERT INTO Reviews VALUES('R9', 5, 'Y12', 'Sep-28-07 17:15:00 PDT ', 'B7');
INSERT INTO Reviews VALUES('R10', 5, 'Y5', 'Oct-29-07 17:15:00 PDT ', 'B8');
INSERT INTO Reviews VALUES('R11', 5, 'Y1', 'Sep-30-07 17:15:00 PDT ', 'B9');
INSERT INTO Reviews VALUES('R12', 5, 'Y12', 'Oct-25-07 17:15:00 PDT ', 'B10');
INSERT INTO Reviews VALUES('R13', 5, 'Y4', 'Sep-25-07 17:15:00 PDT', 'B11');
INSERT INTO Reviews VALUES('R14', 5, 'Y5', 'Sep-25-07 17:15:00 PDT', 'B12');
INSERT INTO Reviews VALUES('R15', 5, 'Y1', 'Sep-29-07 17:15:00 PDT', 'B13');
INSERT INTO Reviews VALUES('R16', 2, 'Y11', 'Jun-07-15 17:15:00 PDT', 'B2');
INSERT INTO Reviews VALUES('R17', 1, 'Y4', 'May-05-15 17:15:00 PDT', 'B2');
INSERT INTO Reviews VALUES('R18', 1, 'Y1', 'May-05-15 17:15:00 PDT ', 'B2');
INSERT INTO Reviews VALUES('R19', 1, 'Y10', 'Oct-25-07 17:15:00 PDT ', 'B3');
INSERT INTO Reviews VALUES('R20', 1, 'Y1', 'Sep-28-07 17:15:00 PDT', 'B4');
INSERT INTO Reviews VALUES('R21', 4, 'Y11', 'Jun-07-15 17:15:00 PDT', 'B14');
INSERT INTO Reviews VALUES('R22', 1, 'Y4', 'May-05-15 17:15:00 PDT', 'B14');
INSERT INTO Reviews VALUES('R23', 1, 'Y1', 'May-05-15 17:15:00 PDT', 'B14');

INSERT INTO Comments VALUES('R2', 'Y3');
INSERT INTO Comments VALUES('R2', 'Y2');
INSERT INTO Comments VALUES('R3', 'Y3');
INSERT INTO Comments VALUES('R7', 'Y8');
INSERT INTO Comments VALUES('R7', 'Y11');
INSERT INTO Comments VALUES('R15', 'Y8');
INSERT INTO Comments VALUES('R16', 'Y8');
INSERT INTO Comments VALUES('R20', 'Y7');
INSERT INTO Comments VALUES('R20', 'Y10');

INSERT INTO Checkin VALUES(1, 'Checkin Info 1', 'B1');
INSERT INTO Checkin VALUES(2, 'Checkin Info 2', 'B2');
INSERT INTO Checkin VALUES(3, 'Checkin Info 3', 'B3');
INSERT INTO Checkin VALUES(4, 'Checkin Info 4', 'B4');
INSERT INTO Checkin VALUES(5, 'Checkin Info 5', 'B5');
INSERT INTO Checkin VALUES(6, 'Checkin Info 6', 'B6');
INSERT INTO Checkin VALUES(7, 'Checkin Info 7', 'B7');
INSERT INTO Checkin VALUES(8, 'Checkin Info 8', 'B8');
INSERT INTO Checkin VALUES(9, 'Checkin Info 9', 'B9');
INSERT INTO Checkin VALUES(10, 'Checkin Info 10', 'B10');
INSERT INTO Checkin VALUES(11, 'Checkin Info 11', 'B11');
INSERT INTO Checkin VALUES(12, 'Checkin Info 12', 'B12');
INSERT INTO Checkin VALUES(13, 'Checkin Info 13', 'B13');