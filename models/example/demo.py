import pandas as pd
import snowflake.snowpark.functions as F
from snowflake.snowpark.session import Session

def model(dbt, session: Session):
    # Get source table
    df = dbt.source("DBT_SCHEMA", "SALES_US")

    # Perform transformation: Multiply QUANTITY_SOLD by 2
    df = df.with_column("QUANTITY_SOLD", df["QUANTITY_SOLD"] * 2)

    return df
