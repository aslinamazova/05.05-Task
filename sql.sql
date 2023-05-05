CREATE DATABASE Library
CREATE TABLE Books(
    Id  INT PRIMARY KEY IDENTITY,
    AuthorId INT REFERENCES Authors(Id),
    BookName NVARCHAR (100),
    PageCount INT CHECK (PageCount >=10)
)
CREATE TABLE Authors(
Id  INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100),
Surname NVARCHAR(100)
)


CREATE VIEW FullName 
AS 
SELECT
Books.Id,
Books.BookName,
Books.PageCount,
Authors.Name,
Authors.Surname

FROM Books
JOIN Authors
ON Authors.Id=Books.AuthorId
SELECT * FROM FullName



CREATE PROCEDURE SelectAll
AS
SELECT * FROM Books 
GO


CREATE TABLE DeletedBooks (
Id INT PRIMARY KEY,
AuthorId INT FOREIGN KEY REFERENCES Authors(Id),
Name NVARCHAR(100) ,
PageCount INT  
)

CREATE FUNCTION MinPageCount(@PageCount INT)
RETURNS INT
AS
BEGIN
DECLARE @Count INT
SELECT @Count = COUNT(*) FROM Books WHERE PageCount >= @PageCount
RETURN @Count
END


CREATE TRIGGER DeleteBooks
ON DeletedBooks
AFTER DELETE,UPDATE
AS
BEGIN
SELECT * FROM Books
END





