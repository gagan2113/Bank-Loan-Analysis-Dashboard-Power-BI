 SELECT * FROM bank_loan_data

SELECT COUNT(id) AS Total_Loan_Applications from bank_loan_data

SELECT COUNT(id) AS MTD_Total_Loan_Applications from bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) as Total_Funded_Amount from bank_loan_data
WHERE MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

SELECT SUM(total_payment) as Total_Amount_Received FROM bank_loan_data
where MONTH(last_payment_date) = 12 AND YEAR(last_payment_date) = 2021

SELECT ROUND(AVG(int_rate)*100,4)as Average_Interest_rate From bank_loan_data
WHERE MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti)*100, 4) as Average_DTI from bank_loan_data
WHERE MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' or loan_status = 'Current' THEN id end)*100)
	/
	COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data

SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Loan_Applications_rECIEVED FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

select count(id) as Bad_Loans FROM bank_loan_data
WHERE loan_status = 'Charged Off' 

SELECT SUM(loan_amount) AS Bad_Loan_Application_Received From bank_loan_data
where loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_Application_Received From bank_loan_data
where loan_status = 'Charged Off'

SELECT
	loan_status,
	COUNT(id) AS Loan_Count, 
	SUM(total_payment) AS Total_Amount_Receievd,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate*100) AS Interst_Rate,
	AVG(dti*100) AS DTI
	FROM bank_loan_data
	GROUP BY
		loan_status
 
 SELECT
	loan_status,
	SUM(total_payment) as MTD_Total_Amount_received,
	SUM(loan_amount) as MTD_Total_Funded_Amount
	FROM bank_loan_data
	where MONTH(issue_date) = 12
	GROUP BY 
	loan_Status

SELECT 
	DATENAME(MONTH, issue_date) AS Month_Number,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) AS Total_Received_Amount
From bank_loan_data
GROUP BY DATENAME(MONTH, issue_date)
ORDER BY DATENAME(MONTH, issue_date)


SELECT 
	address_state,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) AS Total_Received_Amount
From bank_loan_data
GROUP BY address_state
ORDER BY COUNT(id) DESC


SELECT 
	term,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) AS Total_Received_Amount
From bank_loan_data
GROUP BY term
ORDER BY term

SELECT 
	emp_length,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) AS Total_Received_Amount
From bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(ID) DESC

SELECT 
	purpose,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) AS Total_Received_Amount
From bank_loan_data
GROUP BY purpose
ORDER BY COUNT(ID) DESC

SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_Application,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) AS Total_Received_Amount
From bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(ID) DESC

DELETE FROM bank_loan_data
WHERE loan_status IS NULL;


 SELECT * FROM bank_loan_data




























