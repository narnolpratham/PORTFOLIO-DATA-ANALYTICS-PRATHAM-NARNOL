<p algin="centre">
<img src = "https://github.com/narnolpratham/Dashboards/blob/main/Screenshot%202026-04-27%20224012.png"
<width = "900">
</p>

Fintech Fraud Analysis Dashboard
📊 Summary
This analysis reveals a 42.34% global fraud rate alongside $174K in total revenue. The core finding identifies Rishikesh as a "Trojan Horse" market: a high-revenue segment currently suppressed by conservative trust models that misidentify high-value "Whale" users as high-risk threats.
🔍 The "Trojan Horse" Finding
The Paradox: While metropolises like Bangalore show high volume and high fraud, Rishikesh presents a unique profile: high-value transactions concentrated in the "Low Trust" (300-500) bracket.
The Misclassification: Traditional models flag these as threats, but data confirms these are "Clean" high-limit users.
The Impact: Treating Rishikesh with global risk parameters is effectively "locking the gates" on the business’s most profitable untapped segment.
💡 Business Solutions
1. The "Rishikesh Protocol" (Regional Modeling)
Problem: One-size-fits-all scoring throttles Tier-2 growth.
Solution: Implement Regional Risk Coefficients. Relax thresholds for high-value segments in Rishikesh while maintaining strict verification in established high-risk zones like Bangalore.
2. Intelligent Friction (Step-up Auth)
Problem: Legitimate "Whales" are blocked by hard scoring caps.
Solution: Replace hard blocks with Step-up Authentication (MFA/Biometrics) for transactions >$500 within the 300-500 trust range to safely capture suppressed revenue.
🚀 Strategic Recommendations
CRITICAL: Revise the 300-500 Score Range
Target: Recover ~15% of suppressed revenue from "Clean" users by refining flagging logic for emerging markets.
HIGH: Geographic Fraud Buffering
Target: Reduce false positives in Tier-2 cities by 20% through location-aware risk thresholds.
MEDIUM: VIP Fast-Track
Target: Increase retention of high-revenue users by reducing manual review latency for verified high-value accounts.
🛠️ Technical Stack
Python: Data generation, cleaning and city-wise standardization.
SQL: Used Inner joins, case when, windows function(rank) to get potential hidden insigts to help with the buisness.
Power BI: Minimalist dashboard using Small Multiples to visualize the "Trojan Horse" effect without slicer-clutter.
