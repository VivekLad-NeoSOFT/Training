import os
from etl.extract import ExtractData
from etl.transform import TransformData
from etl.load import LoadData

# 1) Extract data
ed = ExtractData()

# Extract data from API endpoint
url = 'https://my.api.mockaroo.com/customer.json'
key = '220e7380'
api_data = ed.read_api(url, key)

# Extract data from file, examples: 'csv', 'json', 'xlsx'
csv_file_path = os.path.join('mock_data_files', 'Customer.csv')
csv_data = ed.read_file(csv_file_path, 'csv')

excel_file_path = os.path.join('mock_data_files', 'Customer.xlsx')
excel_data = ed.read_file(excel_file_path, 'xlsx')

json_file_path = os.path.join('mock_data_files', 'Customer.json')
json_data = ed.read_file(json_file_path, 'json')


# Extract data from MySQL databse table
host = 'localhost'
username = 'your_user'
password = 'your_password'
database = 'training'
table = 'customer'
mysql_data = ed.read_database(host, username, password, database, table)


# 2) Transform data
td = TransformData()

# Parse data to a DataFrame
cleaned_df = td.parse_data(api_data)

# Clean parsed data, example: remove duplicate and empty records.
column = 'email'  # Column name for check unique values
cleaned_df = td.clean_data(cleaned_df, column)


# 3) Load data
ld = LoadData()

# Dump data into a file. Example: 'csv', 'xlsx, 'json'
csv_file_path = os.path.join('output', 'output.csv')
ld.to_file(cleaned_df, csv_file_path, 'csv')

excel_file_path = os.path.join('output', 'output.xlsx')
ld.to_file(cleaned_df, excel_file_path, 'xlsx')

json_file_path = os.path.join('output', 'output.json')
ld.to_file(cleaned_df, json_file_path, 'json')

# dump data into a MySQL Database
table = 'etltemp'
ld.to_database(cleaned_df, host, username, password, database, table)
