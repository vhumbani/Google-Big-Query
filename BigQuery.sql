SELECT  *
FROM retailsales-483714.RETAILSALE.Data;
 -----------------------------------------------------------------------------
 --------Q1. Filter all transactions that occurred in the year 2023. Expected output: All columns
 -- Filter all transactions that occurred in the year 2023
 SELECT *
 FROM retailsales-483714.RETAILSALE.Data
 WHERE DATE BETWEEN '2023-01-01'AND '2023-12-31';

 -----------------------------------------------------
 --2. Filtering + Conditions--2.. Display all transactions where the Total Amount is more than the average Total Amount 
--of the entire dataset. 
SELECT *
FROM retailsales-483714.RETAILSALE.Data
WHERE `TOTAL AMOUNT` >
(SELECT AVG(`TOTAL AMOUNT`)
FROM retailsales-483714.RETAILSALE.Data);

 -----------------------------------------------
--Q3. Calculate the total revenue (sum of Total Amount). Expected output: Total_Revenue
SELECT SUM(`TOTAL AMOUNT`)AS TOTAL_REVENUE
FROM retailsales-483714.RETAILSALE.Data;
------------------------------------------
--Q4. Display all distinct Product Categories in the dataset. Expected output: Product_Category 
SELECT `product category`
 FROM retailsales-483714.RETAILSALE.Data;

---------------------------------
---Q5. For each Product Category, calculate the total quantity sold. Expected output: Product_Category, Total_Quantity
Select 'product catergory',
count(`product category`)As Total_quantity
FROM retailsales-483714.RETAILSALE.Data;
-------------------------------------------------------------
--Q6.Create a column called Age_Group that classifies customers as ‘Youth’ (<30), ‘Adult’ (30–59), and ‘Senior’ (60+). 
--Expected output: Customer_ID, Age, Age_Group
Select `Customer ID`,
Age,
Case 
  WHEN Age <30 Then 'Youth'
  WHEN Age between 30 AND 59 Then 'Adult'
  WHEN Age >60 Then 'Senior'
   Else 'Not applicable'
   End AS AGE_GROUP
   FROM retailsales-483714.RETAILSALE.Data;

   --------------------------------------------------------------
   --Q7. For each Gender, count how many high-value transactions occurred (where Total Amount > 500). 
----Expected output: Gender, High_Value_Transactions
SELECT GENDER,
COUNT(*)AS High_value_transaction_count
from retailsales-483714.RETAILSALE.Data
where `total amount` >500
Group by gender;
-------------------------------------------------------------
--Q8. For each Product Category, show only those categories where the total revenue exceeds 5,000. 
--Expected output: Product_Category, Total_Revenue
Select `Product category`,
sum(`total amount`)As Total_Revenue
From retailsales-483714.RETAILSALE.Data
group by `product category`
having sum(`Total Amount`)>5000;
------------------------------------------------------------------------------------------------------
---Q9. Display a new column called Unit_Cost_Category that labels a transaction as: – 'Cheap' if Price per Unit < 50 – --'Moderate' if Price per Unit between 50 and 200 – 'Expensive' if Price per Unit > 200 
--Expected output: Transaction_ID, Price_per_Unit, Unit_Cost_Category

Select `Transaction ID`,
`Price per unit`,
case
  when `Price per unit` <50 THEN 'Cheap'
  when `Price per unit` between 50 and 200 THEN 'Moderate'
  when `Price per unit` >200 THEN 'Expensive'
  else 'Not applicable'
  End as Unit_cost_category
FROM retailsales-483714.RETAILSALE.Data;  
---------------------------------------------------------------------------------------------------
--Q10. Display all transactions from customers aged 40 or older and add a column 
--Spending_Level showing ‘High’ if Total Amount > 1000, otherwise ‘Low’. Expected output: Customer_ID, Age, Total_Amount,  --Spending_Level
SELECT `CUSTOMER ID`,
AGE,
case 
when `total amount` >1000 THEN 'High'
else 'Low'
End as Total_amount
FROM retailsales-483714.RETAILSALE.Data
where age >40; 
-------------------------------------------------------------



