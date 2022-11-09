/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select P.Name as Product, C.Name as Category
 From products as p
 Inner Join categories as C on C.CategoryID = P.CategoryID
 Where C.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 Select products.Name as "Products", products.Price, reviews.Rating
 From products
 Left Join reviews on reviews.ProductID = products.ProductID
 where reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
Select employees.FirstName, employees.LastName, Sum(sales.Quantity) as Total
From sales
Inner Join employees on employees.EmployeeID = sales.EmployeeID
Group By employees.EmployeeID
Order By Total Desc
Limit 2;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
Select departments.Name AS Department, categories.Name as Category
From departments
Inner Join categories on categories.DepartmentID = departments.DepartmentID
Where categories.Name = 'Appliances' or categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
Select products.Name, Sum(sales.Quantity) as Total, Sum(sales.Quantity * sales.PricePerUnit) as "Total Price"
from products
inner join sales on sales.ProductID = products.ProductID
where products.Name Like '%Hotel California%';
-- Veryifying
select products.Name, products.ProductID
from products
where products.Name Like '%Hotel California%';
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
Select products.Name as "Product Name", reviews.Reviewer, Min(reviews.Rating), reviews.Comment
from products
inner join reviews on reviews.ProductID = products.ProductID
where products.Name Like '%Visio TV%';
-- Verifying
select products.Name, products.ProductID
from products
where products.Name Like '%Visio TV%';

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, Sum(sales.Quantity) as "Total Sold"
from sales
inner join products on products.ProductID = sales.ProductID 
inner join employees on employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID, products.ProductID;