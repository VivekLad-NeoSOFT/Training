from typing import Literal
import pandas as pd
from sqlalchemy import create_engine


class LoadData:
    @staticmethod
    def to_file(data: pd.DataFrame, file_path: str, file_type: Literal['csv', 'xlsx', 'json']) -> None:
        if not isinstance(data, pd.DataFrame):
            print(f'DataFrame is expected, got {type(data)}')
            return
        if file_type == 'csv':
            data.to_csv(file_path, index=False)

        if file_type == 'xlsx':
            data.to_excel(file_path, index=False)

        if file_type == 'json':
            data.to_json(file_path, orient='records')

    @staticmethod
    def to_database(data: pd.DataFrame, host: str, user: str, password: str, database: str, table: str) -> None:
        count = data.shape[0]
        try:
            engine = create_engine(
                f"mysql+mysqlconnector://{user}:{password}@{host}/{database}"
            )

            data.to_sql(
                name=table,
                con=engine,
                if_exists='append',
                index=False
            )
            print(
                f"Inserted {count} rows into '{table}' successfully."
            )

        except Exception as e:
            print(f"Data loading to MySQL failed: {e}")
