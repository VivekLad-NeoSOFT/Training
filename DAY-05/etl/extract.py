from typing import Any, Literal
import requests
import pandas as pd
import json
import mysql.connector
from mysql.connector import Error


class ExtractData:

    @staticmethod
    def read_api(url: str, key: str) -> list[dict[str, Any]] | None:
        headers = {
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:136.0) Gecko/20100101 Firefox/136.0',
            'X-API-Key': key
        }

        try:
            response = requests.get(url, headers=headers)
            if response:
                return json.loads(response.text)
            return []
        except Exception as e:
            print(f'API request failed: {e}')

    @staticmethod
    def read_file(file_path: str, file_type: Literal['csv', 'xlsx', 'json']) -> list[dict[str, Any]] | None:
        if file_type == 'csv':
            try:
                data = pd.read_csv(file_path)
                if not data.empty:
                    return data.to_dict(orient='records')
                return []
            except Exception as e:
                print(f'CSV file read failed: {e}')

        if file_type == 'xlsx':
            try:
                data = pd.read_excel(file_path)
                if not data.empty:
                    return data.to_dict(orient='records')
                return []
            except Exception as e:
                print(f'Excel file read failed: {e}')

        if file_type == 'json':
            try:
                with open(file_path, 'r') as file:
                    data = json.load(file)
                if data:
                    return data
                return []
            except Exception as e:
                print(f'JSON file read failed: {e}')

    @staticmethod
    def read_database(host: str, username: str, password: str, database: str, table: str) -> list[dict[str, Any]]:
        try:
            with mysql.connector.connect(
                host=host,
                user=username,
                password=password,
                database=database
            ) as conn:
                with conn.cursor() as cursor:
                    query = f"SELECT * FROM `{table}`"
                    cursor.execute(query)
                    columns = [col[0] for col in cursor.description]
                    return [dict(zip(columns, row)) for row in cursor.fetchall()]
        except Error as e:
            print(f"MySQL error: {e}")
            return []
