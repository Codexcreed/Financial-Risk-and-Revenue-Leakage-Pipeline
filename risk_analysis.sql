-- CTE to calculate leakage and aggregate risk scores
WITH RiskMetrics AS (
    SELECT 
        transaction_id,
        user_id,
        amount,
        transaction_type,
        merchant_category,
        country,
        expected_fee,
        actual_fee,
        (expected_fee - actual_fee) AS revenue_leakage,
        device_risk_score,
        ip_risk_score,
        is_fraud,
        -- Create a composite risk flag based on device and IP anomalies
        CASE 
            WHEN device_risk_score > 0.8 AND ip_risk_score > 0.8 THEN 'Critical Risk'
            WHEN device_risk_score > 0.6 OR ip_risk_score > 0.6 THEN 'High Risk'
            ELSE 'Normal'
        END as risk_tier
    FROM transactions
)
SELECT 
    *,
    -- Flag accounts that have both high leakage AND high risk for immediate audit
    CASE 
        WHEN revenue_leakage > 0 AND risk_tier IN ('High Risk', 'Critical Risk') THEN 1 
        ELSE 0 
    END as requires_immediate_audit
FROM RiskMetrics;