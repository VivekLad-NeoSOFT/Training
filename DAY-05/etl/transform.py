from typing import Any
import pandas as pd


class TransformData:
    @staticmethod
    def parse_data(data: Any) -> pd.DataFrame:
        try:
            df = pd.DataFrame(data)
            if not df.empty:
                return df
            return pd.DataFrame()
        except Exception as e:
            print(f'Data parsing failed: {e}')

    @staticmethod
    def clean_data(df: pd.DataFrame, column: str) -> pd.DataFrame:
        cleaned = df.dropna(how='any')
        cleaned = cleaned.drop_duplicates(subset=[column], keep='first')
        return cleaned
