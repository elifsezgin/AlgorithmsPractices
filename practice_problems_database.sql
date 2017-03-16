-- 1) Duplicate Emails
-- Write a SQL query to find all duplicate emails in a table named Person.
--
-- +----+---------+
-- | Id | Email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+
-- For example, your query should return the following for the above table:
--
-- +---------+
-- | Email   |
-- +---------+
-- | a@b.com |
-- +---------+

SELECT
    Email
FROM
    Person
GROUP BY
    Email
HAVING
    COUNT(*) > 1

-- 2) Employees Earning More Than Their Managers
-- The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.
--
-- +----+-------+--------+-----------+
-- | Id | Name  | Salary | ManagerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+
-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.
--
-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+

SELECT
    first_table.name as Employee
FROM
    Employee as first_table
JOIN
    Employee as second_table
ON
    first_table.ManagerId = second_table.Id
WHERE
    first_table.Salary > second_table.Salary

-- 3) Combine Two Tables
--
-- Table: Person
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | PersonId    | int     |
-- | FirstName   | varchar |
-- | LastName    | varchar |
-- +-------------+---------+
-- PersonId is the primary key column for this table.
-- Table: Address
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | AddressId   | int     |
-- | PersonId    | int     |
-- | City        | varchar |
-- | State       | varchar |
-- +-------------+---------+
-- AddressId is the primary key column for this table.
--
-- Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:
--
-- FirstName, LastName, City, State

SELECT
    FirstName, LastName, City, State
FROM
    Person
LEFT JOIN
    Address
ON
    Person.PersonId = Address.PersonId
