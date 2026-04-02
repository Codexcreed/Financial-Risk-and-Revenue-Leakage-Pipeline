# Financial Risk & Revenue Leakage Automated Pipeline

**Author:** Indraneel Adak | **Target Market:** UK/Ireland Financial Services 
**Tech Stack:** Python (Pandas), SQL (CTEs, Window Functions), Power BI

## 📌 Executive Summary
Drawing from my experience as an Analyst at Danske Bank (UK), I developed this automated pipeline to identify dual-threat scenarios: **Revenue Leakage** and **Anomalous Transaction Behavior**. This tool analyzes over 10,000 transactions, classifying risk tiers and isolating system pricing failures.

## ⚙️ The Problem
Financial institutions often face "silent" revenue loss due to fee application failures across different transaction gateways (Online, ATM, POS). When combined with high device/IP risk scores, these transactions present both a financial and compliance threat.

## 🚀 The Solution
1. **Data Engineering (Python):** Built a pipeline to ingest transaction data and apply baseline expected fee rules against actual fees collected.
2. **Business Logic (SQL):** Utilized Common Table Expressions (CTEs) to create a 'Composite Risk Tier' and automatically flag transactions requiring immediate audit.
3. **Visualization (Power BI):** Designed an interactive, executive-ready dashboard enabling near real-time monitoring of pricing performance and control gaps.

## 📊 Business Impact
* Identified simulated revenue leakage across 15% of transactions.
* Automated the audit-flagging process, reducing manual reporting effort by an estimated 25% (replicating efficiencies I achieved at Concentrix).
* Grouped critical risk vectors into a single 100% traceable data model.
