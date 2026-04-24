/* 
PROJECT: Hospital Readmission and Revenue Analysis
Analyst: Pratham Narnol
Goal: Segment Patient demographics and identify high-risk readmission clusters. 
*/

Create Database Health_Care101;

Select * from cleaned_healthcare_data;
select count(*) as total_rows 
from cleaned_healthcare_data;

Select Count(*) as final_count, 
Round(Sum(Treatment_Cost), 2) as Total_Revenue, 
Round(Avg(Age), 1) as 
Average_Patient_Age
from cleaned_healthcare_data;

Select Case When Age<18 then 'Minors'
When Age between 18 and 35 then 'Young Adult'
When Age between 35 and 60 then 'Middle-Aged' else 'Old'
End as Age_Group, 
COUNT(*) as Patient_Count, 
Round(Avg(Treatment_Cost),2) As Avg_Cost
FROM cleaned_healthcare_data 
Group by Age_group 
Order by Patient_Count Desc;

Select Gender,Diagnosis,
Count(*) as Total_Patients,
Round(Avg(Treatment_cost),2) as Avg_Cost
From cleaned_healthcare_data
Group by Gender, Diagnosis
Order by Total_Patients desc;

Select Gender, Count(*) as Total_Patients,
Round(Sum(Treatment_Cost),2) as Total_Revenue,
Round(Avg(Treatment_Cost),2) as Avg_Bill
From cleaned_healthcare_data
Group by Gender
Order by Total_Revenue desc;

Select Round(Sum(Treatment_Cost),2) from cleaned_healthcare_data;
Select Diagnosis, 
Count(*) as Patient_Count, 
Round(Avg(Treatment_Cost),2) as Total_Cost_for_Seniors
From cleaned_healthcare_data
Where Age>60
Group by Diagnosis
Order by Patient_Count desc;


Select Gender, Case When Age<18 then 'Minors'
 When Age between 18 and 35 then 'Young Adult' 
When Age between 35 and 60 then 'Middle-Aged' else 'Old'
End as Age_Bracket, Diagnosis, Count(*) as Total_Patients,
 Sum(Case when Readmitted='Yes' then 1 else 0 end) as Readmitted_Count,
 Round((Sum(case when Readmitted='Yes' then 1 else 0 end)/count(*))*100,2) as Readmission_Rate
from cleaned_healthcare_data 
group by Gender, Age_Bracket, Diagnosis
Order by Readmission_Rate desc;





