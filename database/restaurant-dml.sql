--  QUERIES
    -- Get customers with 978 area code
SELECT *
FROM CUSTOMER_t
WHERE Phone LIKE '978%'
ORDER BY C_Name DESC;

	-- Get foods under 10 dollars
SELECT FoodID, Name, Price
FROM FOOD_t
WHERE Price < 10;

	-- Get employee names and IDs who began before 2023
SELECT EmployeeID, E_Name, Date_hired
FROM EMPLOYEE_t
WHERE Date_hired < '2023:00:00';

	-- Get tables with 2+ available seats
SELECT TableNo AS Big_TableID, Available_seats
FROM TABLE_t
WHERE Available_seats > 2;

    -- Count number of people at each table
SELECT TableNo, COUNT(TableNo) as seatsTaken
FROM CUSTOMER_t
GROUP BY TableNo;

    -- Find all customers who paid in cash
SELECT C_Name as cashCustomers
FROM CUSTOMER_t c
WHERE EXISTS
(
    SELECT *
	FROM PAYMENT_t p
	WHERE c.CustID = p.CustID
        AND Type = 'Cash'
);
