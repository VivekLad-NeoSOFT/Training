import time
from datetime import date, time, timedelta, datetime as dt
import datetime

# The datetime module supplies classes for manipulating dates and times.
"""
In the context of date and time handling in programming, "aware" and "naive" 
refer to whether a datetime object has timezone information associated with it.
An aware datetime object knows its timezone, while a naive datetime object does not
"""

# The datetime module exports the following constants:
# The smallest year number allowed in a date or datetime object. MINYEAR is 1.
datetime.MINYEAR  # Outputs: 1

# The largest year number allowed in a date or datetime object. MAXYEAR is 9999.
datetime.MAXYEAR  # Outputs: 9999

# Alias for the UTC time zone singleton.
datetime.UTC  # Outputs: datetime.timezone.utc

"""
Available types
1)  class datetime.date         Attributes: year, month, and day.
2)  class datetime.time         Attributes: hour, minute, second, microsecond, and tzinfo.
3)  class datetime.datetime     Attributes: year, month, day, hour, minute, second, microsecond, and tzinfo.
4)  class datetime.timedelta
5)  class datetime.tzinfo       
6)  class datetime.timezone
"""

# timedelta Objects
"""
A timedelta object represents a duration, the difference between two datetime or date instances.

All arguments are optional and default to 0. Arguments may be integers or floats, and may be positive or negative.

Only days, seconds and microseconds are stored internally. Arguments are converted to those units:

    A millisecond is converted to 1000 microseconds.

    A minute is converted to 60 seconds.

    An hour is converted to 3600 seconds.

    A week is converted to 7 days.

delta = datetime.timedelta(
    days=0, seconds=0,
    microseconds=0, milliseconds=0,
    minutes=0, hours=0, weeks=0
)
"""

# Example
delta = timedelta(
    days=50,
    seconds=27,
    microseconds=10,
    milliseconds=29000,
    minutes=5,
    hours=8,
    weeks=2
)
# Only days, seconds, and microseconds remain
delta  # Outputs: datetime.timedelta(days=64, seconds=29156, microseconds=10)


# Class attributes:
# The most negative timedelta object, timedelta(days=-999999999).
timedelta.min

# The most positive timedelta object, timedelta(days=999999999, seconds=86399, microseconds=999999).
timedelta.max

# The smallest possible difference between non-equal timedelta objects, timedelta(microseconds=1).
timedelta.resolution


# Instance attributes (read-only):
delta.days  # Between -999,999,999 and 999,999,999 inclusive.

delta.seconds  # Between 0 and 86,399 inclusive.

delta.microseconds  # Between 0 and 999,999 inclusive.

# Instance methods:
# Return the total number of seconds contained in the duration.
delta.total_seconds()


# date Objects
"""
A date object represents a date (year, month and day) in an idealized calendar, 
the current Gregorian calendar indefinitely extended in both directions.

class datetime.date(year, month, day)

All arguments are required. Arguments must be integers, in the following ranges:
    MINYEAR <= year <= MAXYEAR
    1 <= month <= 12
    1 <= day <= number of days in the given month and year

"""

# Class methods:
# Return the current local date.
date.today()  # Outputs: datetime.date(2025, 5, 6)

# Return the local date corresponding to the POSIX timestamp.
date.fromtimestamp(time.time())  # Outputs: datetime.date(2025, 5, 6)

# Return the date corresponding to the proleptic Gregorian ordinal, where January 1 of year 1 has ordinal 1.
date.fromordinal(743624)  # Outputs: datetime.date(2036, 12, 21)

# Return a date corresponding to a date_string given in any valid ISO 8601.
date_string = '2019-12-04'
date.fromisoformat(date_string)  # Outputs: datetime.date(2019, 12, 4)

# Return a date corresponding to the ISO calendar date specified by year, week and day.
year, week, day = 2025, 1, 5
date.fromisocalendar(year, week, day)  # Outputs: datetime.date(2025, 1, 5)

# Class attributes:
# The earliest representable date, date(MINYEAR, 1, 1).
date.min  # Outputs: datetime.date(1, 1, 1)

# The latest representable date, date(MAXYEAR, 12, 31).
date.max  # datetime.date(9999, 12, 31)

# The smallest possible difference between non-equal date objects, timedelta(days=1).
date.resolution  # datetime.timedelta(days=1)

# Instance attributes (read-only):
today = dt.today().date()
# Between MINYEAR and MAXYEAR inclusive.
today.year  # Outputs: 2025

# Between 1 and 12 inclusive.
today.month  # Outputs: 5

# Between 1 and the number of days in the given month of the given year.
today.day  # Outputs: 6


# Instance methods:
# Return a new date object with the same values, but with specified parameters updated.
# Outputs: datetime.date(2026, 6, 7)
today.replace(year=today.year + 1, month=today.month + 1, day=today.day + 1)

# Return a time.struct_time such as returned by time.localtime().
# Outputs: time.struct_time(tm_year=2025, tm_mon=5, tm_mday=6, tm_hour=0, tm_min=0, tm_sec=0, tm_wday=1, tm_yday=126, tm_isdst=-1)
today.timetuple()

# Return the proleptic Gregorian ordinal of the date, where January 1 of year 1 has ordinal 1.
today.toordinal()  # Outputs: 739377

# Return the day of the week as an integer, where Monday is 0 and Sunday is 6.
today.weekday()  # Outputs: 1

# Return the day of the week as an integer, where Monday is 1 and Sunday is 7.
today.isoweekday()  # Outputs: 2

# Return a named tuple object with three components: year, week and weekday.
today.isocalendar()  # Outputs: datetime.IsoCalendarDate(year=2025, week=19, weekday=2)

# Return a string representing the date in ISO 8601 format, YYYY-MM-DD.
today.isoformat()  # Outputs: '2025-05-06'

# Return a string representing the date.
today.ctime()  # 'Tue May  6 00:00:00 2025'

# Return a string representing the date, controlled by an explicit format string.
format_string = '%d/%m/%Y, %H:%M:%S'
today.strftime(format_string)  # Outputs: '06/05/2025, 00:00:00'


# datetime Objects
