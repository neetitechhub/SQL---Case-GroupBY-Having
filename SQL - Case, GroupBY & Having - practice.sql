/**
CREATE TABLE [dbo].[Customer](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL
) ON [PRIMARY]
CREATE TABLE [dbo].[Orders](
	[Id] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
	[ProductId] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (101, N'shashank', N'shashank@test.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (102, N'rohit', N'rohit@test.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (103, N'ram', N'ram@test.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (104, N'Neeti', N'neeti@test.com')
INSERT [dbo].[Customer] ([Id], [Name], [Email]) VALUES (105, N'Chiku', N'chiku@test.com')
GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Country], [Amount], [ProductId]) VALUES (1, 101, CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'USA', 100, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Country], [Amount], [ProductId]) VALUES (2, 102, CAST(N'1905-07-12T00:00:00.000' AS DateTime), N'USA', 150, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Country], [Amount], [ProductId]) VALUES (3, 103, CAST(N'1905-07-07T00:00:00.000' AS DateTime), N'Canada', 200, 2)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Country], [Amount], [ProductId]) VALUES (4, 101, CAST(N'1905-07-02T00:00:00.000' AS DateTime), N'USA', 50, 3)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Country], [Amount], [ProductId]) VALUES (5, 104, CAST(N'1905-06-27T00:00:00.000' AS DateTime), N'Mexico', 300, 2)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Country], [Amount], [ProductId]) VALUES (6, 103, CAST(N'1905-06-22T00:00:00.000' AS DateTime), N'Canada', 250, 3)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Country], [Amount], [ProductId]) VALUES (7, 105, CAST(N'1905-06-17T00:00:00.000' AS DateTime), N'USA', 100, 3)
GO

-------------------------------
CREATE TABLE [dbo].[Employee_test](
	[ID] [int] NULL,
	[FirstName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[Salary] [int] NULL,
	[Managerid] [int] NULL,
	[Gender] [varchar](250) NULL,
	[deptName] [varchar](250) NULL,
	[IsActive] [bit] NULL,
	[hiredate] [datetime] NULL,
	[DOB] [datetime] NULL
) 
INSERT [dbo].[Employee_test] ([ID], [FirstName], [LastName], [Salary], [Managerid], [Gender], [deptName], [IsActive], [hiredate], [DOB]) VALUES (1, N'Alice', N'Kizor', 1000, 2, N'F', N'IT', 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Employee_test] ([ID], [FirstName], [LastName], [Salary], [Managerid], [Gender], [deptName], [IsActive], [hiredate], [DOB]) VALUES (2, N'Bob', N'Warry', 200, 1, N'M', N'HR', 1, CAST(N'2023-02-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Employee_test] ([ID], [FirstName], [LastName], [Salary], [Managerid], [Gender], [deptName], [IsActive], [hiredate], [DOB]) VALUES (3, N'Nayan', N'Pandey', 100, 1, N'M', N'Admin', 1, CAST(N'2023-02-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Employee_test] ([ID], [FirstName], [LastName], [Salary], [Managerid], [Gender], [deptName], [IsActive], [hiredate], [DOB]) VALUES (4, N'Rohit', N'Singh', 888, 2, N'M', N'Account', 1, CAST(N'2023-02-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Employee_test] ([ID], [FirstName], [LastName], [Salary], [Managerid], [Gender], [deptName], [IsActive], [hiredate], [DOB]) VALUES (5, N'Rahul', N'Shukla', 10000, 3, N'M', N'HR', 1, CAST(N'2023-02-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Employee_test] ([ID], [FirstName], [LastName], [Salary], [Managerid], [Gender], [deptName], [IsActive], [hiredate], [DOB]) VALUES (6, N'Ankit', N'Tiwari', 6000, 4, N'M', N'IT', 1, CAST(N'2023-02-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Employee_test] ([ID], [FirstName], [LastName], [Salary], [Managerid], [Gender], [deptName], [IsActive], [hiredate], [DOB]) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
**/
--QUESTIONS :
  --1. SORT EMPLOYEE BY DEPARTMENT WHERE HR SHOULD BE ON TOP THEN IT AFTER THAT OTHERS (CUSTOM SORTING)
SELECT *
FROM [EMPLOYEE_TEST]
ORDER BY CASE
             WHEN DEPTNAME = 'HR' THEN 1
             WHEN DEPTNAME = 'IT' THEN 2
             WHEN DEPTNAME = 'ADMIN' THEN 3
             ELSE 0
         END
--2 IF FIRSTNAME IS NULL THEN RETURN LASTNAME IF LAST NAME ALSO NULL THEN RETURN 'NAME DOES NOT EXISTS'
SELECT 
COALESCE(FIRSTNAME,LASTNAME, 'NAME DOES NOT EXISTS'), -- WORKS WHEN YOU NEED TO CHECK MULTIPLE COLUMNS VALUES
ISNULL(FIRSTNAME, 'FIRST NAME NOT EXISTS') -- WORKS ONLY WHEN YOU NEED TO CHECK ONE COLUMNS VALUE
FROM [EMPLOYEE_TEST]
ORDER BY CASE
             WHEN DEPTNAME = 'HR' THEN 1
             WHEN DEPTNAME = 'IT' THEN 2
             WHEN DEPTNAME = 'ADMIN' THEN 3
             ELSE 0
         END	
--3 RETURN FIRST NAME AND LAST NAME IN UPPER CASE & CONCATE FIRST AND LAST NAME
SELECT UPPER(COALESCE(FIRSTNAME, LASTNAME, 'NAME DOES NOT EXISTS')), -- WORKS WHEN YOU NEED TO CHECK MULTIPLE COLUMNS VALUES
       UPPER(ISNULL(FIRSTNAME, 'FIRST NAME NOT EXISTS')),            -- WORKS ONLY WHEN YOU NEED TO CHECK ONE COLUMNS VALUE
       FIRSTNAME + LASTNAME AS 'FULL NAME',                          -- CONCATE FIRST AND LAST NAME
       UPPER(FIRSTNAME + LASTNAME) AS 'FULL NAME'                    -- CONCATE FIRST AND LAST NAME AND SHOW IN UPPER CASE
FROM [EMPLOYEE_TEST]

--4 IF GENDER IS 'M' THEN RETURN MALE AND IF 'F' THEN FEMALE SAME FOR DEPARTNAME.
SELECT  CASE
             WHEN GENDER = 'M' THEN 'MALE'
             WHEN GENDER = 'F' THEN 'FEMALE'
             ELSE 'NA'
         END AS 'FULL GENDER NAME',
		 CASE
             WHEN DEPTNAME = 'HR' THEN 'HUMAN RESOURCE'
             WHEN DEPTNAME = 'IT' THEN 'INFORMATION TECHNOLOGY'
			 WHEN DEPTNAME = 'ACCOUNT' THEN 'ACCOUNTING'
			 WHEN DEPTNAME = 'ADMIN' THEN 'ADMIN SUPPORT'
             ELSE 'NA'
         END AS 'DEPARTMENT FULL NAME'
FROM [EMPLOYEE_TEST]
ORDER BY CASE
             WHEN DEPTNAME = 'HR' THEN 1
             WHEN DEPTNAME = 'IT' THEN 2
             WHEN DEPTNAME = 'ADMIN' THEN 3
             ELSE 0
         END
--5 UPDATE SALAY BASED ON DIFFRENT CRITERIA
UPDATE EMPLOYEE_TEST
SET SALARY = CASE
    WHEN SALARY > 100 THEN SALARY * 10
    WHEN SALARY BETWEEN 50 AND 100 THEN SALARY * 100
    ELSE SALARY
END;

--6 BELOW QUERY SORT DATA BASED ON SELECTED COLUMN , FIRST QUERY SORT BASED ON SALARY & SECOND BASED ON DEPARTMENT
SELECT FIRSTNAME, SALARY, DEPTNAME FROM [EMPLOYEE_TEST] ORDER BY 2
SELECT FIRSTNAME, SALARY, DEPTNAME FROM [EMPLOYEE_TEST] ORDER BY 3

--7  CATEGORIES SALARY 
SELECT
    SALARY,
    CASE
        WHEN SALARY > 1000 THEN 'HIGH'
        WHEN SALARY BETWEEN 500 AND 1000 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS [SALE CATEGORY]
FROM [EMPLOYEE_TEST];

--8 SUM OF EMPLOYEE'S SALARY  DEPARTMENT WISE & DEFINE SALARY WISE CATEGORY
SELECT
    DEPTNAME,
    SUM(SALARY) AS SALARYTOTAL,
    CASE
        WHEN SUM(SALARY) > 5000 THEN 'GREATER THAN 5000'
        WHEN SUM(SALARY) BETWEEN 500 AND 5000 THEN 'BETWEEN 500 AND 5000'
        ELSE 'LESS THAN 500'
    END AS [SALARY CATEGORY]
FROM [EMPLOYEE_TEST]
GROUP BY DEPTNAME


-- GROUP BY & HAVING

SELECT *
FROM ORDERS
SELECT *
FROM CUSTOMER

--TOTAL SALES AMOUNT FOR EACH COUNTRY:
SELECT COUNTRY,
       SUM(AMOUNT) AS TOTALSALES
FROM ORDERS
GROUP BY COUNTRY;

--FILTER THESE RESULTS TO SHOW ONLY COUNTRIES WITH TOTAL SALES GREATER THAN 450
SELECT COUNTRY,
       SUM(AMOUNT) AS TOTALSALES
FROM ORDERS
GROUP BY COUNTRY
HAVING SUM(AMOUNT) > 450;


--FIND THE TOTAL SALES FOR EACH COUNTRY BUT ONLY FOR ORDERS MADE IN JANUARY 2024, AND THEN FILTER TO SHOW ONLY COUNTRIES WITH TOTAL SALES GREATER THAN 300:
SELECT COUNTRY,
       SUM(AMOUNT) AS TOTALSALES
FROM ORDERS
WHERE ORDERDATE >= '2024-01-01'
      AND ORDERDATE <= '2024-01-31'
GROUP BY COUNTRY
HAVING SUM(AMOUNT) > 300;

--FIND TOTAL SALES FOR EACH PRODUCT FOR EACH CUSTOMER:
SELECT CUSTOMERID,
       SUM(AMOUNT) AS TOTAL_SALES
FROM ORDERS
GROUP BY CUSTOMERID;

--TO GET THE TOTAL SALES PER MONTH:

SELECT ORDERDATE,
       MONTH(ORDERDATE) AS SALES_MONTH,
       SUM(AMOUNT) AS TOTAL_SALES
FROM ORDERS
GROUP BY MONTH(ORDERDATE),
         ORDERDATE

--FIND THE MONTHS WHERE TOTAL SALES EXCEEDED $100:
SELECT MONTH(ORDERDATE) AS SALES_MONTH,
       DATENAME(MONTH, ORDERDATE) AS SALES_MONTH_NAME,
       SUM(AMOUNT) AS TOTAL_SALES
FROM ORDERS
GROUP BY MONTH(ORDERDATE),
         DATENAME(MONTH, ORDERDATE)
HAVING SUM(AMOUNT) > 100

--TOTAL SALES FOR EACH PRODUCT FOR CUSTOMERS WHO HAVE SPENT MORE THAN $100 IN TOTAL
SELECT CUSTOMERID,
       SUM(AMOUNT) AS TOTAL_SALES
FROM ORDERS
WHERE CUSTOMERID IN (
                        SELECT CUSTOMERID
                        FROM ORDERS
                        GROUP BY CUSTOMERID
                        HAVING SUM(AMOUNT) > 100
                    )
GROUP BY CUSTOMERID;
