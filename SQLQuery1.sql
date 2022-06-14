
Create Database Library

Use Library

Create Table Books (
	
	Id int Primary Key Identity,
	Name nvarchar(30) Check(Len(Name) > 2 And Len(Name) < 100),
	PageCount int Check(PageCount > 10),
	AuthorId int Foreign Key References Authors(Id)
)

Create Table Authors (

	Id int Primary Key Identity,
	Name nvarchar(30),
	SurName nvarchar(30)
)

Create View usv_GetAllBooksAndAuthors
As
Select Books.Id, Books.Name, Books.PageCount, (Authors.Name+' '+Authors.SurName) FullName From Books
Join Authors On Books.AuthorId = Authors.Id

Create Procedure usp_GetNameAndAuthorFullName
@name nvarchar(50)
As
Begin
	Select * From usv_GetAllBooksAndAuthors
End

Create Procedure usp_InsertAuthorTable
@id int,
@name nvarchar(50)
As
Begin
	Select *  From usv_GetAllBooksAndAuthors
End

Create Procedure usp_UpdateAuthorTable
@id int,
@name nvarchar(50)
As
Begin
	Select * From usv_GetAllBooksAndAuthors
End

Create Procedure usp_DeleteAuthorTable
@id int,
@name nvarchar(50)
As
Begin
	Select * From usv_GetAllBooksAndAuthors
End
exec usp_InsertAuthorTable 1, 'Hello'


Drop Table Books

Drop Table Authors