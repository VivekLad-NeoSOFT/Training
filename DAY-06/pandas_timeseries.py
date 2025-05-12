"""
Pandas provides a rich set of methods, properties, and functions for handling and manipulating date and time data. 
Here's a categorized list of the most important ones:

1) Creating Date/Time Data:
    - pd.to_datetime(): This function converts a scalar, array-like, Series or DataFrame/dict-like to a pandas datetime object.
    - pd.date_range(): Generates a range of dates.
    - pd.timedelta_range(): Generates a range of timedeltas.
    - pd.period_range(): Generates a range of periods.
    - pd.to_timedelta(): Converts input to timedelta.

2. Date/Time Properties (available on datetime-like Series or Index):
    - .dt.date, .dt.time
    - .dt.year, .dt.month, .dt.day
    - .dt.hour, .dt.minute, .dt.second
    - .dt.weekday, .dt.dayofweek, .dt.dayofyear
    - .dt.week, .dt.isocalendar()
    - .dt.quarter
    - .dt.tz,
    - .dt.floor(), .dt.ceil(), .dt.round()
"""


import pandas as pd
import numpy as np

# 1) Creating Date/Time Data:

# 1.1) pd.to_datetime():
df = pd.DataFrame(
    {'year': [2015, 2016],
     'month': [2, 3],
     'day': [4, 5]
     }
)
pd.to_datetime(df)

# Output:
"""
0   2015-02-04
1   2016-03-05
dtype: datetime64[ns]
"""

# 1.2) pd.date_range():
pd.date_range(start='1/1/2018', end='1/08/2018')

# Output:
"""
DatetimeIndex(['2018-01-01', '2018-01-02', '2018-01-03', '2018-01-04',
               '2018-01-05', '2018-01-06', '2018-01-07', '2018-01-08'],
              dtype='datetime64[ns]', freq='D')
"""

# 1.3) pd.timedelta_range():
pd.timedelta_range(start='1 day', periods=4)

# Output:
"""
TimedeltaIndex(['1 days', '2 days', '3 days', '4 days'], dtype='timedelta64[ns]', freq='D')
"""

# 1.4) pd.peroid_range():
pd.period_range(start='2017-01-01', end='2018-01-01', freq='M')

# Output:
"""
PeriodIndex(['2017-01', '2017-02', '2017-03', '2017-04', '2017-05', '2017-06',
             '2017-07', '2017-08', '2017-09', '2017-10', '2017-11', '2017-12',
             '2018-01'],
            dtype='period[M]')
"""

# 1.5) pd.to_timedelta():
pd.to_timedelta('1 days 06:05:01.00003')

# Output:
"""
Timedelta('1 days 06:05:01.000030')
"""

# 2) Date/Time Properties:
datetime_series = pd.Series(
    pd.date_range("2000-01-01", periods=3, freq="YE")
)

# 2.1) pandas.Series.dt.date - Returns numpy array of python datetime.date objects.
datetime_series.dt.date
# Output:
"""
0    2000-12-31
1    2001-12-31
2    2002-12-31
dtype: object
"""

# 2.2) pandas.Series.dt.time - Returns numpy array of datetime.time objects.
datetime_series.dt.date

# Output:
"""
0    00:00:00
1    00:00:00
2    00:00:00
dtype: object
"""

# 2.3) pandas.Series.dt.timetz - Returns numpy array of datetime.time objects with timezones.
s = pd.Series(["1/1/2020 10:00:00+00:00", "2/1/2020 11:00:00+00:00"])
s = pd.to_datetime(s)
s.dt.timetz

# Output:
"""
0    10:00:00+00:00
1    11:00:00+00:00
dtype: object
"""

# 2.4) pandas.Series.dt.year - The year of the datetime.
datetime_series.dt.year

# Output:
"""
0    2000
1    2001
2    2002
dtype: int32
"""

# 2.5) pandas.Series.dt.month - The month as January=1, December=12.
datetime_series.dt.month

# Output:
"""
0    12
1    12
2    12
dtype: int32
"""

# 2.6) pandas.Series.dt.day - The day of the datetime.
datetime_series.dt.day

# Output:
"""
0    31
1    31
2    31
dtype: int32
"""

# 2.7) pandas.Series.dt.hour - The hours of the datetime.
datetime_series = pd.Series(
    pd.date_range("2000-01-01", periods=3, freq="h")
)

datetime_series.dt.hour

# Output:
"""
0    0
1    1
2    2
dtype: int32
"""

# 2.8) pandas.Series.dt.minute - The minutes of the datetime.
datetime_series = pd.Series(
    pd.date_range("2000-01-01", periods=3, freq="min")
)
datetime_series.dt.minute

# Output:
"""
0    0
1    1
2    2
dtype: int32
"""

# 2.9) pandas.Series.dt.second - The seconds of the datetime.
datetime_series = pd.Series(

    pd.date_range("2000-01-01", periods=3, freq="s")

)
datetime_series.dt.second

# Output:
"""
0    0
1    1
2    2
dtype: int32
"""

# 2.10) pandas.Series.dt.weekday - The day of the week with Monday=0, Sunday=6.
s = pd.date_range('2016-12-31', '2017-01-08', freq='D').to_series()
s.dt.weekday

# Output:
"""
2016-12-31    5
2017-01-01    6
2017-01-02    0
2017-01-03    1
2017-01-04    2
2017-01-05    3
2017-01-06    4
2017-01-07    5
2017-01-08    6
Freq: D, dtype: int32
"""

# 2.11) pandas.Series.dt.dayofyear - The ordinal day of the year.
s = pd.Series(["1/1/2020 10:00:00+00:00", "2/1/2020 11:00:00+00:00"])
s = pd.to_datetime(s)
s.dt.dayofyear

# Output:
"""
0    1
1   32
dtype: int32
"""

# 2.12) pandas.Series.dt.days_in_month - The number of days in the month.
s = pd.Series(["1/1/2020 10:00:00+00:00", "2/1/2020 11:00:00+00:00"])
s = pd.to_datetime(s)
s.dt.daysinmonth

# Output:
"""
0    31
1    29
dtype: int32
"""

# 2.13) pandas.Series.dt.quarter - The quarter of the date.
s = pd.Series(["1/1/2020 10:00:00+00:00", "4/1/2020 11:00:00+00:00"])
s = pd.to_datetime(s)
s.dt.quarter

# Output:
"""
0    1
1    2
dtype: int32
"""

# 2.14) pandas.Series.dt.tz - Return the timezone.
s = pd.Series(["1/1/2020 10:00:00+00:00", "2/1/2020 11:00:00+00:00"])
s = pd.to_datetime(s)
s.dt.tz

# Output:
"""
datetime.timezone.utc
"""

# 2.15) pandas.Series.dt.isocalendar - Calculate year, week, and day according to the ISO 8601 standard.
ser = pd.to_datetime(pd.Series(["2010-01-01", pd.NaT]))
ser.dt.isocalendar()
ser.dt.isocalendar().week

"""
0      53
1    <NA>
Name: week, dtype: UInt32
"""

# 2.16) pandas.Series.dt.strftime - Convert to Index using specified date_format.
rng = pd.date_range(pd.Timestamp("2018-03-10 09:00"), periods=3, freq='s')
rng.strftime('%B %d, %Y, %r')

# Output:
"""
Index(['March 10, 2018, 09:00:00 AM', 'March 10, 2018, 09:00:01 AM',
       'March 10, 2018, 09:00:02 AM'],
      dtype='object')
"""

# 2.17) pandas.Series.dt.floor - Perform floor operation on the data to the specified freq.
rng = pd.date_range('1/1/2018 11:59:00', periods=3, freq='min')
rng.floor('h')

# Output:
"""
DatetimeIndex(['2018-01-01 11:00:00', '2018-01-01 12:00:00',
               '2018-01-01 12:00:00'],
              dtype='datetime64[ns]', freq=None)
"""

# 2.18) pandas.Series.dt.ceil - Perform ceil operation on the data to the specified freq.
rng = pd.date_range('1/1/2018 11:59:00', periods=3, freq='min')
rng.ceil('h')

# Output:
"""
DatetimeIndex(['2018-01-01 12:00:00', '2018-01-01 12:00:00',
               '2018-01-01 13:00:00'],
              dtype='datetime64[ns]', freq=None)
"""

# 2.19) pandas.Series.dt.month_name - Return the month names with specified locale.
idx = pd.date_range(start='2018-01', freq='ME', periods=3)
idx.month_name()

# Output:
"""
Index(['January', 'February', 'March'], dtype='object')
"""
