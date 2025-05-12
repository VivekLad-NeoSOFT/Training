from typing import Any
import pandas as pd


class GenerateReport:
    def __init__(self, data: Any):
        self.data = data
        self.df = self.get_dataframe()

    def get_dataframe(self):
        try:
            df = pd.DataFrame(self.data)
            return df
        except Exception as e:
            print(f'Data conversion failed: {e}')

    def customers_per_city(self):
        customers_per_city = self.df.groupby(
            'city'
        )['customer_id'].count().reset_index()

        customers_per_city.columns = ['city', 'total_customers']
        print(customers_per_city.to_string())

    def customers_per_state(self):
        customers_per_state = self.df.groupby(
            'state'
        )['customer_id'].count().reset_index()
        customers_per_state.columns = ['state', 'total_customers']
        print(customers_per_state.to_string())
