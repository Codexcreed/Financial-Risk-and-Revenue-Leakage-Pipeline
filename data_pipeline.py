import pandas as pd
import sqlite3
import numpy as np

# 1. Load the raw data
df = pd.read_csv("synthetic_fraud_dataset.csv")

# 2. Simulate Revenue Leakage (A common banking issue)
# Standard Fee Rules: Online=2%, ATM=1.5%, Others=1%
conditions = [
    df['transaction_type'] == 'Online',
    df['transaction_type'] == 'ATM'
]
choices = [df['amount'] * 0.02, df['amount'] * 0.015]
df['expected_fee'] = np.select(conditions, choices, default=df['amount'] * 0.01)

# Simulate actual_fee with a 15% system failure rate (actual fee applied was 0)
np.random.seed(42)
leakage_mask = np.random.rand(len(df)) < 0.15
df['actual_fee'] = np.where(leakage_mask, 0.0, df['expected_fee'])

# 3. Load into SQL Database for Transformation
conn = sqlite3.connect("portfolio_risk.db")
df.to_sql("transactions", conn, if_exists="replace", index=False)
print("Pipeline stage 1 complete: Data loaded and enriched.")