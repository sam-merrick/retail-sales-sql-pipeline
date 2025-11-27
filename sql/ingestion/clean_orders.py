import pandas as pd

df = pd.read_csv(r'C:\DE\SQL\Projects\northwind_orders.csv', quotechar='"', encoding='utf-8')

print(df.head())
print(df.info())

# Wrap ship_address in double quotes
df['ship_address'] = df['ship_address'].apply(lambda x: f'"{x}"')

df.to_csv(r'C:\DE\SQL\Projects\northwind_orders_clean.csv', index=False, encoding='utf-8')