CREATE DATABASE MY_PROJECT;
USE MY_PROJECT;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    DateCreated DATE
);

CREATE TABLE Campaigns (
    CampaignID INT AUTO_INCREMENT PRIMARY KEY,
    CampaignName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(10, 2),
    Channel VARCHAR(50)  -- e.g., Email, Social Media
);

CREATE TABLE Leads (
    LeadID INT AUTO_INCREMENT PRIMARY KEY,
    LeadName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Status VARCHAR(20),  -- e.g., New, Contacted, Qualified
    Source VARCHAR(50),  -- e.g., Referral, Ad Campaign
    DateAdded DATE,
    CampaignID INT,  -- Optional link to Campaigns
    FOREIGN KEY (CampaignID) REFERENCES Campaigns(CampaignID)
);

CREATE TABLE SalesOpportunities (
    OpportunityID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OpportunityName VARCHAR(100),
    Amount DECIMAL(10, 2),
    Status VARCHAR(20),  -- e.g., Open, Won, Lost
    DateCreated DATE,
    ExpectedCloseDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE SupportTickets (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    IssueDescription TEXT,
    Status VARCHAR(20),  -- e.g., Open, In Progress, Closed
    DateOpened DATE,
    DateClosed DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    Category VARCHAR(50),  -- e.g., Software, Hardware, Subscription
    DateAdded DATE
);

CREATE TABLE Invoices (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(20),  -- e.g., Paid, Pending, Overdue
    DueDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, DateCreated) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St, NY', '2023-01-05'),
('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Oak St, LA', '2023-02-15'),
('Alice', 'Johnson', 'alice.j@example.com', '1234509876', '789 Pine St, TX', '2023-03-20'),
('Bob', 'Williams', 'bob.w@example.com', '6543210987', '321 Cedar St, FL', '2023-04-10'),
('Charlie', 'Brown', 'charlie.b@example.com', '7890123456', '111 Birch St, OH', '2023-05-12'),
('Emily', 'Davis', 'emily.d@example.com', '1230984567', '234 Walnut St, IL', '2023-06-15'),
('Frank', 'Miller', 'frank.m@example.com', '2345678910', '567 Chestnut St, WA', '2023-07-05'),
('Grace', 'Wilson', 'grace.w@example.com', '3456789120', '890 Ash St, MA', '2023-08-22'),
('Henry', 'Moore', 'henry.m@example.com', '4567891230', '123 Redwood St, CO', '2023-09-10'),
('Ivy', 'Clark', 'ivy.c@example.com', '5678912340', '456 Maple St, GA', '2023-10-01');

INSERT INTO SalesOpportunities (CustomerID, OpportunityName, Amount, Status, DateCreated, ExpectedCloseDate) VALUES
(1, 'Website Redesign', 15000.00, 'Open', '2023-01-10', '2023-12-01'),
(2, 'Mobile App Development', 25000.00, 'Won', '2023-03-15', '2023-09-30'),
(3, 'Cloud Migration', 50000.00, 'Lost', '2023-05-20', '2023-12-15'),
(4, 'SEO Optimization', 8000.00, 'Open', '2023-06-10', '2023-11-05'),
(5, 'Data Analysis Project', 12000.00, 'Won', '2023-07-12', '2023-10-25'),
(6, 'AI Chatbot Integration', 18000.00, 'Open', '2023-08-10', '2024-01-15'),
(7, 'E-commerce Platform Upgrade', 22000.00, 'Lost', '2023-09-05', '2023-12-20'),
(8, 'Cybersecurity Assessment', 30000.00, 'Won', '2023-10-01', '2023-12-15'),
(9, 'Network Infrastructure Setup', 40000.00, 'Open', '2023-10-10', '2024-03-01'),
(10, 'CRM System Implementation', 25000.00, 'Open', '2023-11-02', '2024-02-15');

INSERT INTO Leads (LeadName, Email, Phone, Status, Source, DateAdded, CampaignID) VALUES
('Samuel Green', 'sam.green@example.com', '3216549870', 'New', 'Referral', '2023-02-01', 1),
('Nina Adams', 'nina.adams@example.com', '4561237890', 'Contacted', 'Ad Campaign', '2023-03-12', 2),
('Liam White', 'liam.w@example.com', '7894561230', 'Qualified', 'Email Campaign', '2023-04-15', 3),
('Sophia King', 'sophia.k@example.com', '1237894560', 'New', 'Referral', '2023-05-10', 1),
('Oliver Scott', 'oliver.s@example.com', '6547891230', 'Contacted', 'Social Media', '2023-06-20', 2),
('Emma Baker', 'emma.b@example.com', '9873216540', 'Qualified', 'Email Campaign', '2023-07-01', 3),
('Noah Harris', 'noah.h@example.com', '1236547890', 'New', 'Ad Campaign', '2023-08-05', 4),
('Mia Rodriguez', 'mia.r@example.com', '4569871230', 'Contacted', 'Referral', '2023-09-10', 1),
('Lucas Walker', 'lucas.w@example.com', '7891236540', 'Qualified', 'Social Media', '2023-10-15', 2),
('Ava Hall', 'ava.h@example.com', '3219876540', 'New', 'Ad Campaign', '2023-11-02', 3);

INSERT INTO SupportTickets (CustomerID, IssueDescription, Status, DateOpened, DateClosed) VALUES
(1, 'Website down for 2 hours', 'Closed', '2023-06-01', '2023-06-01'),
(2, 'Payment gateway not working', 'In Progress', '2023-07-10', NULL),
(3, 'Slow loading times on the app', 'Open', '2023-08-15', NULL),
(4, 'Unable to access cloud server', 'Closed', '2023-09-20', '2023-09-21'),
(5, 'Bug in the data analysis tool', 'Open', '2023-10-05', NULL),
(6, 'Question about subscription plans', 'Closed', '2023-10-10', '2023-10-11'),
(7, 'Security concern regarding data', 'Open', '2023-10-15', NULL),
(8, 'Feedback on CRM usage', 'Closed', '2023-10-20', '2023-10-21'),
(9, 'Request for network setup help', 'In Progress', '2023-10-25', NULL),
(10, 'Inquiry about the latest product features', 'Open', '2023-10-30', NULL);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    Category VARCHAR(50),  -- e.g., Software, Hardware, Subscription
    DateAdded DATE
);

INSERT INTO Products (ProductName, Description, Price, Category, DateAdded) VALUES
('Web Hosting', 'Reliable web hosting services', 99.99, 'Software', '2023-01-10'),
('SEO Toolkit', 'Tools for SEO optimization', 199.99, 'Software', '2023-02-15'),
('E-commerce Template', 'Pre-designed templates for online stores', 49.99, 'Software', '2023-03-05'),
('Analytics Software', 'Analyze data and generate reports', 149.99, 'Software', '2023-03-20'),
('Email Marketing Software', 'Send bulk emails and track campaigns', 89.99, 'Software', '2023-04-01'),
('Security Software', 'Protect your systems from threats', 129.99, 'Software', '2023-05-01'),
('CRM Software', 'Manage customer relationships effectively', 299.99, 'Software', '2023-05-15'),
('Mobile App', 'Native mobile applications for iOS and Android', 399.99, 'Software', '2023-06-01'),
('Online Course', 'Learn new skills online', 59.99, 'Subscription', '2023-07-01'),
('Consultation Service', 'Personalized consultation for businesses', 199.99, 'Service', '2023-08-01');

CREATE TABLE Invoices (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(20),  -- e.g., Paid, Pending, Overdue
    DueDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Invoices (CustomerID, InvoiceDate, TotalAmount, Status, DueDate) VALUES
(1, '2023-06-10', 15000.00, 'Paid', '2023-07-10'),
(2, '2023-07-15', 25000.00, 'Pending', '2023-08-15'),
(3, '2023-08-20', 50000.00, 'Overdue', '2023-09-20'),
(4, '2023-09-10', 8000.00, 'Paid', '2023-10-10'),
(5, '2023-10-01', 12000.00, 'Pending', '2023-10-31'),
(6, '2023-10-05', 18000.00, 'Paid', '2023-11-05'),
(7, '2023-10-15', 22000.00, 'Pending', '2023-11-15'),
(8, '2023-10-25', 30000.00, 'Paid', '2023-11-25'),
(9, '2023-11-01', 40000.00, 'Pending', '2023-12-01'),
(10, '2023-11-05', 25000.00, 'Paid', '2023-12-05');

-- Customer Management Scenarios

-- 1. Add new customers
INSERT INTO Customers (firstName, lastName, Email, Phone, Address, DateCreated) VALUES
('Alice', 'Johnson', 'alice@example.com', '123-456-7890', '123 Maple St', NOW()),
('Bob', 'Smith', 'bob@example.com', '234-567-8901', '456 Oak St', NOW());

-- 2. Update customer details
UPDATE Customers SET Email = 'alice.johnson@example.com' WHERE firstName = 'Alice' AND lastName = 'Johnson';

-- 3. Delete a customer
DELETE FROM Customers WHERE firstName = 'Bob' AND lastName = 'Smith';

-- 4. Find customers with the most sales opportunities
SELECT c.CustomerID, CONCAT(c.firstName, ' ', c.lastName) AS FullName, COUNT(so.OpportunityID) AS OpportunityCount
FROM Customers c
JOIN SalesOpportunities so ON c.CustomerID = so.CustomerID
GROUP BY c.CustomerID;

-- 5. List customers with no sales in the last 6 months
SELECT c.CustomerID, CONCAT(c.firstName, ' ', c.lastName) AS FullName
FROM Customers c
LEFT JOIN SalesOpportunities so ON c.CustomerID = so.CustomerID AND so.DateCreated > NOW() - INTERVAL 6 MONTH
WHERE so.OpportunityID IS NULL;

-- 6. Find customers with the highest total sales
SELECT c.CustomerID, CONCAT(c.firstName, ' ', c.lastName) AS FullName, SUM(so.Amount) AS TotalSales
FROM Customers c
JOIN SalesOpportunities so ON c.CustomerID = so.CustomerID
WHERE so.Status = 'Won'
GROUP BY c.CustomerID
ORDER BY TotalSales DESC;

-- 7. List customers with unresolved support tickets
SELECT c.CustomerID, CONCAT(c.firstName, ' ', c.lastName) AS FullName, COUNT(st.TicketID) AS OpenTickets
FROM Customers c
JOIN SupportTickets st ON c.CustomerID = st.CustomerID
WHERE st.Status = 'Open'
GROUP BY c.CustomerID;

-- 8. Retrieve customers in a specific region
SELECT * FROM Customers WHERE Address LIKE '%New York%';

-- 9. Customers with both won opportunities and closed tickets
SELECT DISTINCT c.CustomerID, CONCAT(c.firstName, ' ', c.lastName) AS FullName
FROM Customers c
JOIN SalesOpportunities so ON c.CustomerID = so.CustomerID AND so.Status = 'Won'
JOIN SupportTickets st ON c.CustomerID = st.CustomerID AND st.Status = 'Closed';

-- 10. List customers added in the last month
SELECT * FROM Customers WHERE DateCreated > NOW() - INTERVAL 1 MONTH;

-- Sales Opportunities

-- 1. Add new sales opportunities
INSERT INTO SalesOpportunities (CustomerID, OpportunityName, ExpectedCloseDate, Amount, Status, DateCreated) VALUES
(1, 'Website Development', '2024-01-15', 50000.00, 'Open', NOW()),
(2, 'Mobile App Development', '2024-02-20', 75000.00, 'Open', NOW());

-- 2. Update sales opportunity status
UPDATE SalesOpportunities SET Status = 'Won' WHERE OpportunityID = 1;

-- 3. Find open opportunities for a customer
SELECT * FROM SalesOpportunities WHERE CustomerID = 1 AND Status = 'Open';

-- 4. Calculate total sales from won opportunities
SELECT SUM(Amount) AS TotalSales FROM SalesOpportunities WHERE Status = 'Won';

-- 5. List overdue opportunities
SELECT * FROM SalesOpportunities WHERE ExpectedCloseDate < NOW() AND Status != 'Won';

-- 6. Customer with the most won opportunities
SELECT CustomerID, COUNT(OpportunityID) AS WonOpportunities
FROM SalesOpportunities WHERE Status = 'Won'
GROUP BY CustomerID
ORDER BY WonOpportunities DESC
LIMIT 1;

-- 7. Search for opportunities in a specific time period
SELECT * FROM SalesOpportunities WHERE DateCreated BETWEEN '2024-01-01' AND '2024-01-31';

-- 8. List all opportunities and their statuses for a specific customer
SELECT OpportunityName, Status FROM SalesOpportunities WHERE CustomerID = 1;

-- Leads and Campaigns

-- 1. Add new leads and link to campaigns
INSERT INTO Leads (CustomerID, LeadSource, Status, CampaignID, DateCreated) VALUES
(1, 'Website', 'Contacted', 1, NOW()),
(2, 'Referral', 'Qualified', 2, NOW());

-- 2. Track number of leads generated by each campaign
SELECT CampaignID, COUNT(LeadID) AS LeadCount FROM Leads GROUP BY CampaignID;

-- 3. Find leads contacted but not yet qualified
SELECT * FROM Leads WHERE Status = 'Contacted';

-- 4. Track campaign performance (lead conversion rates)
SELECT c.CampaignID, COUNT(l.LeadID) AS TotalLeads, COUNT(so.OpportunityID) AS ConvertedOpportunities
FROM Campaigns c
LEFT JOIN Leads l ON c.CampaignID = l.CampaignID
LEFT JOIN SalesOpportunities so ON l.LeadID = so.LeadID
GROUP BY c.CampaignID;

-- 5. Update lead status
UPDATE Leads SET Status = 'Converted' WHERE LeadID = 1;

-- 6. List campaigns that generated no leads
SELECT c.CampaignID, c.CampaignName
FROM Campaigns c
LEFT JOIN Leads l ON c.CampaignID = l.CampaignID
WHERE l.LeadID IS NULL;

-- Support Tickets

-- 1. Create new support tickets
INSERT INTO SupportTickets (CustomerID, IssueDescription, Status, DateOpened) VALUES
(1, 'Website down', 'Open', NOW()),
(2, 'Payment not processed', 'Open', NOW());

-- 2. Track open vs closed tickets
SELECT Status, COUNT(TicketID) AS TicketCount FROM SupportTickets GROUP BY Status;

-- 3. Find customers with the most unresolved tickets
SELECT CustomerID, COUNT(TicketID) AS OpenTickets
FROM SupportTickets WHERE Status = 'Open'
GROUP BY CustomerID;

-- 4. Calculate average time to close a ticket
SELECT AVG(DATEDIFF(DateClosed, DateOpened)) AS AverageCloseTime
FROM SupportTickets WHERE Status = 'Closed';

-- 5. Generate report of open tickets this month
SELECT * FROM SupportTickets WHERE Status = 'Open' AND MONTH(DateOpened) = MONTH(NOW()) AND YEAR(DateOpened) = YEAR(NOW());

-- Invoices and Products

-- 1. Add invoices for completed sales opportunities
INSERT INTO Invoices (CustomerID, OpportunityID, InvoiceDate, TotalAmount, Status) VALUES
(1, 1, NOW(), 50000.00, 'Pending'),
(2, 2, NOW(), 75000.00, 'Paid');

-- 2. List unpaid invoices
SELECT * FROM Invoices WHERE Status != 'Paid';

-- 3. Retrieve customer invoices within a date range
SELECT * FROM Invoices WHERE InvoiceDate BETWEEN '2024-01-01' AND '2024-01-31';

-- 4. Identify most popular products sold
SELECT ProductID, COUNT(InvoiceID) AS SalesCount
FROM InvoiceProducts GROUP BY ProductID ORDER BY SalesCount DESC;

-- 5. Calculate total revenue from all invoices
SELECT SUM(TotalAmount) AS TotalRevenue FROM Invoices;

-- 6. Find overdue invoices
SELECT * FROM Invoices WHERE DueDate < NOW() AND Status != 'Paid';

-- Now the Advance MYSQL starts

DELIMITER $$

-- 1. List Customers with More Than X Opportunities
CREATE PROCEDURE GetCustomersWithOpportunities(IN min_opportunities INT)
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(o.OpportunityID) AS OpportunitiesCount
    FROM Customers c
    JOIN SalesOpportunities o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID
    HAVING OpportunitiesCount > min_opportunities;
END $$

-- 2. Retrieve Customer Details and Total Invoice Amount
CREATE PROCEDURE GetCustomerInvoiceDetails()
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName, SUM(i.TotalAmount) AS TotalInvoiceAmount
    FROM Customers c
    JOIN Invoices i ON c.CustomerID = i.CustomerID
    GROUP BY c.CustomerID;
END $$

-- 3. Find Customers with Support Tickets in the Last 30 Days
CREATE PROCEDURE GetRecentSupportTicketsCustomers()
BEGIN
    SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
    FROM Customers c
    JOIN SupportTickets t ON c.CustomerID = t.CustomerID
    WHERE t.CreatedDate >= CURDATE() - INTERVAL 30 DAY;
END $$

-- 4. Calculate Total Revenue from Paid Invoices
CREATE PROCEDURE GetTotalRevenue()
BEGIN
    SELECT SUM(TotalAmount) AS TotalRevenue
    FROM Invoices
    WHERE Status = 'Paid';
END $$

-- 5. Get the Average Deal Size for Won Opportunities
CREATE PROCEDURE GetAvgDealSize()
BEGIN
    SELECT AVG(o.Amount) AS AvgDealSize
    FROM SalesOpportunities o
    WHERE o.Status = 'Won';
END $$

-- 6. Track Campaign Performance Based on Leads Generated
CREATE PROCEDURE TrackCampaignPerformance()
BEGIN
    SELECT c.CampaignID, c.CampaignName, COUNT(l.LeadID) AS LeadsGenerated, c.Budget
    FROM Campaigns c
    LEFT JOIN Leads l ON c.CampaignID = l.CampaignID
    GROUP BY c.CampaignID;
END $$

-- 7. Count Open vs Closed Support Tickets
CREATE PROCEDURE GetTicketCounts()
BEGIN
    SELECT Status, COUNT(TicketID) AS TicketCount
    FROM SupportTickets
    GROUP BY Status;
END $$

-- 8. List Overdue Invoices
CREATE PROCEDURE GetOverdueInvoices()
BEGIN
    SELECT InvoiceID, CustomerID, TotalAmount, DueDate
    FROM Invoices
    WHERE DueDate < CURDATE() AND Status = 'Pending';
END $$

-- 9. Retrieve Most Sold Products
CREATE PROCEDURE GetMostSoldProducts()
BEGIN
    SELECT p.ProductID, p.ProductName, SUM(oi.Quantity) AS TotalQuantitySold
    FROM Products p
    JOIN OrderItems oi ON p.ProductID = oi.ProductID
    GROUP BY p.ProductID
    ORDER BY TotalQuantitySold DESC;
END $$

-- 10. Find Customers with No Sales Opportunities
CREATE PROCEDURE GetCustomersWithoutOpportunities()
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName
    FROM Customers c
    LEFT JOIN SalesOpportunities o ON c.CustomerID = o.CustomerID
    WHERE o.OpportunityID IS NULL;
END $$

-- 11. Get the Top 5 Customers Based on Total Sales
CREATE PROCEDURE GetTop5CustomersBySales()
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName, SUM(i.TotalAmount) AS TotalSales
    FROM Customers c
    JOIN Invoices i ON c.CustomerID = i.CustomerID
    WHERE i.Status = 'Paid'
    GROUP BY c.CustomerID
    ORDER BY TotalSales DESC
    LIMIT 5;
END $$

-- 12. List All Open Opportunities for a Specific Customer
CREATE PROCEDURE GetOpenOpportunitiesForCustomer(IN customerId INT)
BEGIN
    SELECT OpportunityID, OpportunityName, Amount, Status
    FROM SalesOpportunities
    WHERE CustomerID = customerId AND Status = 'Open';
END $$

-- 13. Find Customers Without Invoices
CREATE PROCEDURE GetCustomersWithoutInvoices()
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName
    FROM Customers c
    LEFT JOIN Invoices i ON c.CustomerID = i.CustomerID
    WHERE i.InvoiceID IS NULL;
END $$

-- 14. Get Campaign Performance (Leads and Budget)
CREATE PROCEDURE GetCampaignPerformance()
BEGIN
    SELECT c.CampaignID, c.CampaignName, c.Budget, COUNT(l.LeadID) AS LeadsGenerated
    FROM Campaigns c
    LEFT JOIN Leads l ON c.CampaignID = l.CampaignID
    GROUP BY c.CampaignID;
END $$

-- 15. Count Total Opportunities by Status
CREATE PROCEDURE GetOpportunitiesByStatus()
BEGIN
    SELECT Status, COUNT(OpportunityID) AS TotalOpportunities
    FROM SalesOpportunities
    GROUP BY Status;
END $$

-- 16. Find Customers With High-Value Opportunities
CREATE PROCEDURE GetHighValueOpportunitiesCustomers(IN minValue DECIMAL(10, 2))
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.Amount) AS TotalOpportunityValue
    FROM Customers c
    JOIN SalesOpportunities o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID
    HAVING TotalOpportunityValue > minValue;
END $$

-- 17. Find Overdue Support Tickets
CREATE PROCEDURE GetOverdueSupportTickets()
BEGIN
    SELECT t.TicketID, t.CustomerID, t.Issue, t.CreatedDate
    FROM SupportTickets t
    WHERE t.Status = 'Open' AND t.CreatedDate < CURDATE() - INTERVAL 30 DAY;
END $$

-- 18. Count Support Tickets by Status
CREATE PROCEDURE GetSupportTicketsByStatus()
BEGIN
    SELECT Status, COUNT(TicketID) AS TotalTickets
    FROM SupportTickets
    GROUP BY Status;
END $$

-- 19. Find Customers with Pending Invoices
CREATE PROCEDURE GetCustomersWithPendingInvoices()
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(i.InvoiceID) AS PendingInvoices
    FROM Customers c
    JOIN Invoices i ON c.CustomerID = i.CustomerID
    WHERE i.Status = 'Pending'
    GROUP BY c.CustomerID;
END $$

-- 20. Calculate Average Opportunity Size for Each Customer
CREATE PROCEDURE GetAvgOpportunitySizeForCustomers()
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName, AVG(o.Amount) AS AvgOpportunitySize
    FROM Customers c
    JOIN SalesOpportunities o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID;
END $$

-- 21. Find the Most Recent Opportunity for Each Customer
CREATE PROCEDURE GetMostRecentOpportunitiesForCustomers()
BEGIN
    SELECT o.OpportunityID, o.OpportunityName, o.Amount, o.CustomerID
    FROM SalesOpportunities o
    WHERE o.CreatedDate = (
        SELECT MAX(so.CreatedDate)
        FROM SalesOpportunities so
        WHERE so.CustomerID = o.CustomerID
    );
END $$

-- 22. Get the Total Sales Amount for a Given Campaign
CREATE PROCEDURE GetTotalSalesForCampaign(IN campaignId INT)
BEGIN
    SELECT SUM(i.TotalAmount) AS TotalSales
    FROM Invoices i
    JOIN Leads l ON i.CustomerID = l.CustomerID
    WHERE l.CampaignID = campaignId;
END $$

-- 23. Retrieve Customers with No Open Opportunities
CREATE PROCEDURE GetCustomersWithNoOpenOpportunities()
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName
    FROM Customers c
    LEFT JOIN SalesOpportunities o ON c.CustomerID = o.CustomerID AND o.Status = 'Open'
    WHERE o.OpportunityID IS NULL;
END $$

-- 24. Find Products with the Most Sales in Revenue
CREATE PROCEDURE GetTopSellingProductsByRevenue()
BEGIN
    SELECT p.ProductID, p.ProductName, SUM(oi.Quantity * oi.UnitPrice) AS TotalRevenue
    FROM Products p
    JOIN OrderItems oi ON p.ProductID = oi.ProductID
    GROUP BY p.ProductID
    ORDER BY TotalRevenue DESC;
END $$

-- 25. Calculate Total Revenue for Each Region
CREATE PROCEDURE GetTotalRevenueByRegion()
BEGIN
    SELECT c.Region, SUM(i.TotalAmount) AS TotalRevenue
    FROM Customers c
    JOIN Invoices i ON c.CustomerID = i.CustomerID
    WHERE i.Status = 'Paid'
    GROUP BY c.Region;
END $$

-- 26. Retrieve Leads that Converted to Sales
CREATE PROCEDURE GetConvertedLeads()
BEGIN
    SELECT l.LeadID, l.LeadName, o.OpportunityID, o.Status
    FROM Leads l
    JOIN SalesOpportunities o ON l.LeadID = o.LeadID
    WHERE o.Status = 'Won';
END $$

-- 27. Get the Average Invoice Amount for Each Customer
CREATE PROCEDURE GetAvgInvoiceAmountForCustomers()
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName, AVG(i.TotalAmount) AS AvgInvoiceAmount
    FROM Customers c
    JOIN Invoices i ON c.CustomerID = i.CustomerID
    WHERE i.Status = 'Paid'
    GROUP BY c.CustomerID;
END $$

-- 28. Get Customers with Most Leads in the Last Year
CREATE PROCEDURE GetCustomersWithMostLeadsLastYear()
BEGIN
    SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(l.LeadID) AS TotalLeads
    FROM Customers c
    JOIN Leads l ON c.CustomerID = l.CustomerID
    WHERE l.CreatedDate >= CURDATE() - INTERVAL 1 YEAR
    GROUP BY c.CustomerID
    ORDER BY TotalLeads DESC;
END $$

-- 29. Find Campaigns Without Leads
CREATE PROCEDURE GetCampaignsWithoutLeads()
BEGIN
    SELECT c.CampaignID, c.CampaignName
    FROM Campaigns c
    LEFT JOIN Leads l ON c.CampaignID = l.CampaignID
    WHERE l.LeadID IS NULL;
END $$

-- 30. Find Opportunities Closed in the Last 6 Months
CREATE PROCEDURE GetOpportunitiesClosedInLastSixMonths()
BEGIN
    SELECT OpportunityID, OpportunityName, Amount, Status
    FROM SalesOpportunities
    WHERE Status = 'Closed' AND ClosedDate >= CURDATE() - INTERVAL 6 MONTH;
END $$

-- Call examples for all procedures
CALL GetCustomersWithOpportunities(5);
CALL GetCustomerInvoiceDetails();
CALL GetRecentSupportTicketsCustomers();
CALL GetTotalRevenue();
CALL GetAvgDealSize();
CALL TrackCampaignPerformance();
CALL GetTicketCounts();
CALL GetOverdueInvoices();
CALL GetMostSoldProducts();
CALL GetCustomersWithoutOpportunities();
CALL GetTop5CustomersBySales();
CALL GetOpenOpportunitiesForCustomer(1); -- Replace with actual CustomerID
CALL GetCustomersWithoutInvoices();
CALL GetCampaignPerformance();
CALL GetOpportunitiesByStatus();
CALL GetHighValueOpportunitiesCustomers(10000); -- Replace with actual value
CALL GetOverdueSupportTickets();
CALL GetSupportTicketsByStatus();
CALL GetCustomersWithPendingInvoices();
CALL GetAvgOpportunitySizeForCustomers();
CALL GetMostRecentOpportunitiesForCustomers();
CALL GetTotalSalesForCampaign(1); -- Replace with actual CampaignID
CALL GetCustomersWithNoOpenOpportunities();
CALL GetTopSellingProductsByRevenue();
CALL GetTotalRevenueByRegion();
CALL GetConvertedLeads();
CALL GetAvgInvoiceAmountForCustomers();
CALL GetCustomersWithMostLeadsLastYear();
CALL GetCampaignsWithoutLeads();
CALL GetOpportunitiesClosedInLastSixMonths();

DELIMITER ;

