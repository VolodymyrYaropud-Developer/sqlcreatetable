CREATE TABLE Employee(
Id INT PRIMARY KEY,
Name VARCHAR(50)
);

CREATE TABLE Status(
Id INT PRIMARY KEY,
Name VARCHAR(50) UNIQUE
);

CREATE TABLE Position(
Id INT PRIMARY KEY,
Name VARCHAR(50) UNIQUE
);

CREATE TABLE Task(
Id INT PRIMARY KEY,
Name VARCHAR(50),
StatusId INT,
EmployeeId int,
FOREIGN KEY (EmployeeId) REFERENCES Employee(Id),
FOREIGN KEY (StatusId) REFERENCES Status(Id)
);

CREATE TABLE Project(
Id INT PRIMARY KEY,
Name VARCHAR(50),
DateOfCreation date,
DateOfClosure date,
StatusId INT,
TaskId INT,
FOREIGN KEY (TaskId) REFERENCES Task(Id),
FOREIGN KEY (StatusId) REFERENCES Status(Id)
);

CREATE TABLE deadline (
Id INT PRIMARY KEY,
DateOfDeadline DATE,
EmployeeId INT,
FOREIGN KEY (EmployeeId) REFERENCES Employee(Id)
);

CREATE TABLE Positions(
ProjectId INT,
EmployeeId INT,
PositionId INT,
FOREIGN KEY (ProjectId) REFERENCES Project(Id),
FOREIGN KEY (EmployeeId) REFERENCES Employee(Id),
FOREIGN KEY (PositionId) REFERENCES Position(Id),
UNIQUE (ProjectId, EmployeeId, PositionId)
);