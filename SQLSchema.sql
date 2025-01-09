create database task_mgmt;
use task_mgmt;

Create table Users (
ID int PRIMARY KEY,
Username varchar(40),
CompanyName varchar(40),
EmployeeID int,
EmailID varchar(30),
CreatedDate date
);

Create table Teams (
TeamID int PRIMARY KEY,
ProjectID int
);

Create Table Team_Members (
TeamID int,
UserID int,
PRIMARY KEY (TeamID,UserID)
);

Create Table Projects (
ID int PRIMARY KEY,
PType varchar(20),
LeadID int,
Description varchar(255),
StartDate date,
BoardID int,
FOREIGN KEY Projects(LeadID) References Users(ID)
);

Create Table Project_Version(
VersionID int PRIMARY KEY,
ProjectID int,
ReleaseDate date,
URL varchar(255),
Description varchar(255),
CreateDate date,
FOREIGN KEY (ProjectID) References Projects(ID)
);
Create Table WorksOn (
ProjectID int,
UserID int,
PRIMARY KEY (ProjectID,UserID),
FOREIGN KEY (ProjectID) References Projects(ID),
FOREIGN KEY (UserID) References Users(ID)
);



CREATE TABLE Sprints (
ID int PRIMARY KEY,
Duration int,
StartDate date,
ProjectID int,
FOREIGN KEY (ProjectID) references Projects(ID)
);


CREATE Table Issues (
ID int,
ProjectID int,
CreatorID int,
CreatedDate date,
IssueType varchar(20),
Priority int,
ResolutionDate date,
AssignedTo int,
SprintID int,
PRIMARY KEY (ID,ProjectID),
FOREIGN KEY (ProjectID) references Projects(ID),
FOREIGN KEY (CreatorID) references Users(ID),
FOREIGN KEY (AssignedTo) references Users(ID),
FOREIGN KEY (SprintID) references Sprints(ID)
);
 
CREATE Table TestCases(
ID int,
ProjectID int,
Steps varchar(255),
ExpectedOutput varchar(255),
PRIMARY KEY (ID,ProjectID),
FOREIGN KEY (ProjectID) references Projects(ID)
);

CREATE Table Boards ( 
ID int PRIMARY KEY,
ProjectID int,
FOREIGN KEY (ProjectID) references Projects(ID)
);

