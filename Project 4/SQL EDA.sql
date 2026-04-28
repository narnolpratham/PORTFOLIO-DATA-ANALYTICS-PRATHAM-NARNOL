create Database Fintech_Fraud_Analysis;
USE Fintech_Fraud_Analysis;

Select * from users_dim_final as u;
Select * from transactions_fact_final as t;

Select u.user_id,u.city,t.amount, t.is_fraud
From users_dim_final as u
Inner join transactions_fact_final as t on u.user_id = t.user_id;

With CityRankings as (
select
u.city, t.amount,
Rank () Over (partition by u.city Order by t.amount desc) as city_spend_rank
from users_dim_final as u
Inner join transactions_fact_final as t on u.user_id=t.user_id
where t.is_fraud = 0 )
Select * from CityRankings 
Where City_spend_rank <=5;

Select
u.city, t.amount,
Rank () Over (Order by t.amount desc) as City_Rank
from users_dim_final as u
Inner join transactions_fact_final as t 
On u.user_id = t.user_id
Where t.is_fraud=0
Order by t.amount desc Limit 5;

Select
u.city, t.amount, u.trust_score,
Rank () Over (Order by t.amount desc) as City_Rank
from users_dim_final as u
Inner join transactions_fact_final as t 
On u.user_id = t.user_id
Where t.is_fraud=0
Order by t.amount desc Limit 5;

SELECT 
    u.city, 
    ROUND(AVG(u.trust_score), 2) AS avg_city_trust_score,
    COUNT(u.user_id) AS total_customers
FROM users_dim_final AS u
GROUP BY u.city
ORDER BY avg_city_trust_score DESC;

SELECT 
    u.city, 
    ROUND(SUM(t.amount), 2) AS total_revenue,
    COUNT(t.tx_id) AS transaction_count
FROM users_dim_final as u
JOIN transactions_fact_final as t ON u.user_id = t.user_id
WHERE t.is_fraud = 0
GROUP BY u.city
ORDER BY total_revenue DESC limit 6
;

SELECT 
    CASE 
        WHEN u.trust_score >= 700 THEN 'High Trust (700+)'
        WHEN u.trust_score >= 500 THEN 'Mid Trust (500-699)'
        ELSE 'Low Trust (<500)'
    END AS trust_category,
    ROUND(AVG(t.amount), 2) AS avg_transaction_value
FROM users_dim_final u
JOIN transactions_fact_final t ON u.user_id = t.user_id
WHERE t.is_fraud = 0
GROUP BY trust_category;

SELECT 
    u.city, 
    SUM(t.amount) AS total_fraud_value,
    COUNT(*) AS fraud_attempts
FROM users_dim_final u
JOIN transactions_fact_final t ON u.user_id = t.user_id
WHERE t.is_fraud = 1
GROUP BY u.city
ORDER BY total_fraud_value DESC;

SELECT 
    u.city,
    CASE 
        WHEN u.trust_score >= 700 THEN 'High Trust (700+)'
        WHEN u.trust_score >= 500 THEN 'Mid Trust (500-699)'
        ELSE 'Low Trust (<500)'
    END AS trust_category,
    ROUND(AVG(t.amount), 2) AS avg_spend,
    COUNT(t.tx_id) AS transaction_count
FROM users_dim_final u
JOIN transactions_fact_final t ON u.user_id = t.user_id
WHERE t.is_fraud = 0
GROUP BY u.city, trust_category
ORDER BY u.city, avg_spend DESC;

SELECT 
    u.user_id, 
    u.city, 
    u.trust_score, 
    SUM(t.amount) AS total_spent
FROM users_dim_final as u
JOIN transactions_fact_final as t ON u.user_id = t.user_id
WHERE t.is_fraud = 0
GROUP BY u.user_id, u.city, u.trust_score
HAVING total_spent > 1000
ORDER BY u.trust_score ASC
LIMIT 5;

SELECT 
    u.user_id, 
    u.city, 
    u.trust_score, 
    COUNT(t.tx_id) AS total_transactions,
    ROUND(SUM(t.amount), 2) AS total_spent,
    ROUND(AVG(t.amount), 2) AS avg_ticket_size
FROM users_dim_final u
JOIN transactions_fact_final t ON u.user_id = t.user_id
WHERE u.user_id IN (1149, 1198, 1014, 1143, 1189)
  AND t.is_fraud = 0
GROUP BY u.user_id, u.city, u.trust_score
ORDER BY total_transactions DESC;