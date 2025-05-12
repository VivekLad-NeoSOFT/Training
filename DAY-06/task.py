"""
    1. datetime formatting
    2. find day_name using date column
    3. add dayname column in df
    4. find min date
    5. find max date
    6. filter df greater or less than given year/date
    7. set_index
    8. head
    9. resample - daily, weekly, monthly, Quarterly, yearly
    10. aggregations - sum, min, max, mean, count, std, first, last
    11. timezone functions
    12. time series functions
"""

import pandas as pd
import numpy as np

# Generate sample datetime data
np.random.seed(0)
dates = pd.date_range('2022-01-01', periods=100, freq='D')
values = np.random.randint(10, 100, size=100)
df = pd.DataFrame({'date': dates, 'value': values})

# 1. Datetime formatting
df['date_str'] = df['date'].dt.strftime('%Y-%m-%d')

# Output:
"""
 	date 	value 	date_str
0 	2022-01-01 	54 	01-01-2022
1 	2022-01-02 	57 	02-01-2022
2 	2022-01-03 	74 	03-01-2022
3 	2022-01-04 	77 	04-01-2022
4 	2022-01-05 	77 	05-01-2022
"""

# 2. Find day_name using date column
df['day_name'] = df['date'].dt.day_name()

# Output:
"""
 	date 	value 	date_str 	day_name
0 	2022-01-01 	54 	01-01-2022 	Saturday
1 	2022-01-02 	57 	02-01-2022 	Sunday
2 	2022-01-03 	74 	03-01-2022 	Monday
3 	2022-01-04 	77 	04-01-2022 	Tuesday
4 	2022-01-05 	77 	05-01-2022 	Wednesday
"""

# 3. Add dayname column in df (already done above)

# 4. Find min date
min_date = df['date'].min()

# Output:
"""
Timestamp('2022-01-01 00:00:00')
"""

# 5. Find max date
max_date = df['date'].max()

# Output:
"""
Timestamp('2022-04-10 00:00:00')
"""

# 6. Filter df greater or less than given year/date
df_2022 = df[df['date'].dt.year == 2022]
df_before_feb = df[df['date'] < '2022-02-01']

# Output:
"""
date 	value
0 	2022-01-01 	54
1 	2022-01-02 	57
2 	2022-01-03 	74
3 	2022-01-04 	77
4 	2022-01-05 	77
"""

# 7. Set 'date' as index
df.set_index('date', inplace=True)

# Output:
"""
 	value
date 	
2022-01-01 	54
2022-01-02 	57
2022-01-03 	74
2022-01-04 	77
2022-01-05 	77
"""

# 8. View head
print(df.head())

# Output:
"""
        date  value
0 2022-01-01     54
1 2022-01-02     57
2 2022-01-03     74
3 2022-01-04     77
4 2022-01-05     77
"""

# 9. Resample - daily, weekly, monthly, quarterly, yearly
index = pd.date_range('2022-01-01', periods=100, freq='D')
series = pd.Series(range(100), index=index)

daily = series.resample('D').mean()
# Output:
"""
2022-01-01     0.0
2022-01-02     1.0
2022-01-03     2.0
2022-01-04     3.0
2022-01-05     4.0
"""

weekly = series.resample('W').mean()
# Output:
"""
2022-01-02     0.5
2022-01-09     5.0
2022-01-16    12.0
2022-01-23    19.0
2022-01-30    26.0
2022-02-06    33.0
2022-02-13    40.0
2022-02-20    47.0
2022-02-27    54.0
2022-03-06    61.0
2022-03-13    68.0
2022-03-20    75.0
2022-03-27    82.0
2022-04-03    89.0
2022-04-10    96.0
Freq: W-SUN, dtype: float64
"""

monthly = series.resample('ME').mean()
# Output:
"""
2022-01-31    15.0
2022-02-28    44.5
2022-03-31    74.0
2022-04-30    94.5
Freq: ME, dtype: float64
"""

quarterly = series.resample('QE').mean()
# Output:
"""
2022-03-31    44.5
2022-06-30    94.5
Freq: QE-DEC, dtype: float64
"""

yearly = series.resample('YE').mean()
# Output:
"""
2022-12-31    49.5
Freq: YE-DEC, dtype: float64
"""

# 10. Aggregations
aggregated = series.resample('ME').agg(
    ['sum', 'min',
     'max', 'mean',
     'count', 'std',
     'first', 'last'
     ]
)

# Output:
"""
 	sum 	min 	max 	mean 	count 	std 	first 	last
2022-01-31 	465 	0 	30 	15.0 	31 	9.092121 	0 	30
2022-02-28 	1246 	31 	58 	44.5 	28 	8.225975 	31 	58
2022-03-31 	2294 	59 	89 	74.0 	31 	9.092121 	59 	89
2022-04-30 	945 	90 	99 	94.5 	10 	3.027650 	90 	99
"""

# 11. Timezone functions
df_tz = df.tz_localize('UTC')              # Localize
df_tz = df_tz.tz_convert('Asia/Kolkata')   # Convert to local time zone

# 12. Time series functions
df['rolling_mean_7'] = df['value'].rolling(window=7).mean()
df['expanding_mean'] = df['value'].expanding().mean()
df['ewma'] = df['value'].ewm(span=7, adjust=False).mean()
df['diff'] = df['value'].diff()

# Output:
"""
 	date 	value 	rolling_mean_7 	expanding_mean 	ewma 	diff
0 	2022-01-01 	54 	NaN 	54.000000 	54.000000 	NaN
1 	2022-01-02 	57 	NaN 	55.500000 	54.750000 	3.0
2 	2022-01-03 	74 	NaN 	61.666667 	59.562500 	17.0
3 	2022-01-04 	77 	NaN 	65.500000 	63.921875 	3.0
4 	2022-01-05 	77 	NaN 	67.800000 	67.191406 	0.0
"""
