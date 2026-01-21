CREATE OR REPLACE TABLE silver.crm_prd_info (
    prd_id          INTEGER,
    cat_id          STRING,
    prd_key         STRING,
    prd_nm          STRING,
    prd_cost        INTEGER,
    prd_line        STRING,
    prd_start_dt    DATE,
    prd_end_dt      DATE,
    dwh_create_ts   TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP()
);

INSERT INTO silver.crm_prd_info (
    prd_id,
    cat_id,
    prd_key,
    prd_nm,
    prd_cost,
    prd_line,
    prd_start_dt,
    prd_end_dt
)
SELECT
    prd_id,
    REPLACE(SUBSTR(prd_key, 1, 5), '-', '_') AS cat_id,
    SUBSTR(prd_key, 7) AS prd_key,
    prd_nm,
    COALESCE(prd_cost, 0) AS prd_cost,
    CASE
        WHEN UPPER(TRIM(prd_line)) = 'M' THEN 'Mountain'
        WHEN UPPER(TRIM(prd_line)) = 'R' THEN 'Road'
        WHEN UPPER(TRIM(prd_line)) = 'S' THEN 'Other Sales'
        WHEN UPPER(TRIM(prd_line)) = 'T' THEN 'Touring'
        ELSE 'n/a'
    END AS prd_line,
    CAST(prd_start_dt AS DATE) AS prd_start_dt,
    DATEADD(
        day, -1,
        LEAD(CAST(prd_start_dt AS DATE)) OVER (
            PARTITION BY SUBSTR(prd_key, 7)
            ORDER BY CAST(prd_start_dt AS DATE)
        )
    ) AS prd_end_dt
FROM bronze.crm_prd_info;
