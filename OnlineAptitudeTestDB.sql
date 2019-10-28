USE master
IF EXISTS(SELECT * FROM sys.databases where name='OnlineAptitudeTest')
DROP DATABASE OnlineAptitudeTest

CREATE DATABASE OnlineAptitudeTest
GO
USE OnlineAptitudeTest
GO

CREATE TABLE [Role](
    [RoleID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[RoleName] [varchar](50) NOT NULL,
)
​
CREATE TABLE [Admin_Manager](
    [AdminID] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleID] [int] NOT NULL FOREIGN KEY REFERENCES [Role]([RoleID]),
	[Email] [varchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Phone] [varchar](45) NULL,
	[LastLogin] [datetime] NULL,
)
​
CREATE TABLE [Test](
	[TestCode] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Time_To_Do] [int] NOT NULL,
	[TimeStart] [datetime] NOT NULL,
	[TimeCreate] [datetime] default getdate(), 
	[CreateBy] [int] NOT NULL FOREIGN KEY REFERENCES [Admin_Manager]([AdminID]),
	[Note] [ntext] NULL,
)
​
CREATE TABLE [Candidate](
    [CandidateID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleID] [int] NOT NULL FOREIGN KEY REFERENCES [Role]([RoleID]),
	[Email] [varchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Phone] [varchar](45) NULL,
	[Education_Details] [ntext] NULL,
	[Work_Experience] [ntext] NULL,
	[TestCode] [int] NULL FOREIGN KEY REFERENCES [Test]([TestCode]),
	[Pass]  [int] NULL ,
	[ScoreFinal] [float] NULL,
	[Last_Login] [datetime] NULL,
)
​
CREATE TABLE [Score](
    [ScoreID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[CandidateID] [int] NOT NULL FOREIGN KEY REFERENCES [Candidate]([CandidateID]),
​
	[Part1Score] [float] NOT NULL,
	[Part2Score] [float] NOT NULL,
	[Part3Score] [float] NOT NULL,
)
​
CREATE TABLE [QuestionType](
   [TypeID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
   [TypeName] [varchar](50) NOT NULL,  
)​
​
CREATE TABLE [Question](
    [QuestionID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	
	[TypeID] [int] NOT NULL FOREIGN KEY REFERENCES [QuestionType]([TypeID]),
	[Question] [ntext] NOT NULL,
	[Answer_a] [ntext] NOT NULL,
	[Answer_b] [ntext] NOT NULL,
	[Answer_c] [ntext] NOT NULL,
	[Answer_d] [ntext] NOT NULL,
	[CorrectAnswer] [ntext] NULL,
	[TimeStamp] [datetime] default getdate()
​
)
​​
CREATE TABLE [TestQuestion](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[TestCode] int NOT NULL FOREIGN KEY REFERENCES [Test]([TestCode]),
	[QuestionID] [int] NOT NULL FOREIGN KEY REFERENCES [Question]([QuestionID]),
)

CREATE TABLE [TestCandidate](
	[TestCode] int NOT NULL ,
	[CandidateID] int NOT NULL,

	PRIMARY KEY([TestCode],[CandidateID]),​
	FOREIGN KEY ([CandidateID]) REFERENCES [Candidate]([CandidateID]),
	FOREIGN KEY ([TestCode]) REFERENCES [Test]([TestCode]),
)
​
​
​
​
INSERT INTO [Role] ([RoleName]) VALUES ('Admin'); 
INSERT INTO [Role] ([RoleName]) VALUES ('Manager'); 
INSERT INTO [Role] ([RoleName]) VALUES ('Candidate');
​
INSERT INTO [Admin_Manager] ([Username],[Password],[RoleID],[Email],[Name],[Gender],[Birthday],[Phone],[LastLogin]) 
                   VALUES ('PhamHuynh','e10adc3949ba59abbe56e057f20f883e',1,'PhamHuynh@gmail.com','Pham Huynh','male','1/1/1999','0123456789','1/1/2019');
INSERT INTO [Admin_Manager] ([Username],[Password],[RoleID],[Email],[Name],[Gender],[Birthday],[Phone],[LastLogin]) 
                   VALUES ('LeKhoa','e10adc3949ba59abbe56e057f20f883e',1,'KhoaLe@gmail.com','Le Khoa','male','1/1/1999','0123456789','1/1/2019');
INSERT INTO [Admin_Manager] ([Username],[Password],[RoleID],[Email],[Name],[Gender],[Birthday],[Phone],[LastLogin]) 
                   VALUES ('HaTan','e10adc3949ba59abbe56e057f20f883e',2,'HaTan@gmail.com','Ha Tan','male','1/1/1999','0123456789','1/1/2019');
INSERT INTO [Admin_Manager] ([Username],[Password],[RoleID],[Email],[Name],[Gender],[Birthday],[Phone],[LastLogin]) 
                   VALUES ('ThanhTai','e10adc3949ba59abbe56e057f20f883e',2,'ThanhTai@gmail.com','Thanh Tai','male','1/1/1999','0123456789','1/1/2019');
​
INSERT INTO [Candidate] ([Username],[Password],[RoleID],[Email],[Name],[Gender],[Birthday],[Phone])
				   VALUES ('Candidate1','781e5e245d69b566979b86e28d23f2c7',3,'huynh@gmail.com','Pham Huynh','male','1/1/2000','0123456789')
INSERT INTO [Candidate] ([Username],[Password],[RoleID],[Email],[Name],[Gender],[Birthday],[Phone])
				   VALUES ('Candidate2','781e5e245d69b566979b86e28d23f2c7',3,'khoa@gmail.com','Khoa Le','male','1/1/2000','0123456789')
INSERT INTO [Candidate] ([Username],[Password],[RoleID],[Email],[Name],[Gender],[Birthday],[Phone])
				   VALUES ('Candidate3','781e5e245d69b566979b86e28d23f2c7',3,'tan@gmail.com','Ha Tan','male','1/1/2000','0123456789')
​
​


