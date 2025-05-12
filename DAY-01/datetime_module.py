import time
from datetime import date, time, timedelta, datetime as dt
import datetime

# NOTE:Outputs may vary based on curent date and time.

"""
The datetime module supplies classes for manipulating dates and times.

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
"""
A datetime object is a single object containing all the information from a date object and a time object.
datetime.datetime(year, month, day, hour=0, minute=0, second=0, microsecond=0, tzinfo=None, *, fold=0)
The year, month and day arguments are required.

The remaining arguments must be integers in the following ranges:
    MINYEAR <= year <= MAXYEAR,
    1 <= month <= 12,
    1 <= day <= number of days in the given month and year,
    0 <= hour < 24,
    0 <= minute < 60,
    0 <= second < 60,
    0 <= microsecond < 1000000,
    fold in [0, 1].
"""
# Class methods:
# Return the current local date and time, with tzinfo None.
dt.today()  # Outputs: datetime.datetime(2025, 5, 6, 14, 9, 34, 207360)

# Return the current local date and time.
dt.now()  # Outputs: datetime.datetime(2025, 5, 6, 14, 10, 36, 380000)

# Return the local date and time corresponding to the POSIX timestamp.
timestamp = time.time()
# Outputs: datetime.datetime(2025, 5, 6, 14, 13, 9, 101706)
dt.fromtimestamp(timestamp)

# Return the datetime corresponding to the proleptic Gregorian ordinal, where January 1 of year 1 has ordinal 1.
dt.fromordinal(743624)  # Outputs: datetime.datetime(2036, 12, 21, 0, 0)

# Return a new datetime object whose date components are equal to the given date object’s,
# and whose time components are equal to the given time object’s.
random_date = dt(2021, 2, 23)
random_time = datetime.time(11, 23)
# Outputs: datetime.datetime(2021, 2, 23, 11, 23)
dt.combine(random_date, random_time)

# Return a datetime corresponding to a date_string in any valid ISO 8601 format.
dt.fromisoformat('2011-11-04')  # Outputs: datetime.datetime(2011, 11, 4, 0, 0)

# Return a datetime corresponding to the ISO calendar date specified by year, week and day.
# Outputs: datetime.datetime(2024, 8, 13, 0, 0)
dt.fromisocalendar(2024, 33, 2)

# Return a datetime corresponding to date_string, parsed according to format.
dt.strptime(date_string, '%Y-%m-%d')  # datetime.datetime(2019, 12, 4, 0, 0)

# Class attributes:
# The earliest representable datetime, datetime(MINYEAR, 1, 1, tzinfo=None).
dt.min  # Outputs: datetime.datetime(1, 1, 1, 0, 0)

# The latest representable datetime, datetime(MAXYEAR, 12, 31, 23, 59, 59, 999999, tzinfo=None).
dt.max  # Outputs: datetime.datetime(9999, 12, 31, 23, 59, 59, 999999)

# The smallest possible difference between non-equal datetime objects, timedelta(microseconds=1).
dt.resolution  # Outputs: datetime.timedelta(microseconds=1)

# Instance attributes (read-only):
# Between MINYEAR and MAXYEAR inclusive.
today.year  # Outputs: 2025

# Between 1 and 12 inclusive.
today.month  # Outputs: 5

# Between 1 and the number of days in the given month of the given year.
today.day  # Outputs: 6

# In range(24).
today.hour  # Outputs: 15

# In range(60).
today.minute  # Outputs: 30

# In range(60).
today.second  # Outputs: 34

# In range(1000000).
today.microsecond  # Outputs: 211380

# The object passed as the tzinfo argument to the datetime constructor, or None if none was passed.
today.tzinfo

# In [0, 1]. Used to disambiguate wall times during a repeated interval.
today.fold  # Outputs: 0

# Instance methods:
# Return date object with same year, month and day.
today.date()  # Outputs: datetime.date(2025, 5, 6)

# Return time object with same hour, minute, second, microsecond and fold. tzinfo is None.
today.time()  # Outputs: datetime.time(15, 30, 43, 211380)

# Return time object with same hour, minute, second, microsecond, fold, and tzinfo attributes.
today.timetz()  # Outputs: datetime.time(15, 30, 43, 211380)

# Return a new datetime object with the same attributes, but with specified parameters updated.
today.replace(
    year=today.year + 1, month=today.month + 1, day=today.day + 1, hour=today.hour + 1, minute=today.minute + 1,
    second=today.second + 1, microsecond=today.microsecond + 1, tzinfo=today.tzinfo, fold=0
)  # Outputs: datetime.datetime(2026, 6, 7, 16, 31, 44, 211381)

# Return the proleptic Gregorian ordinal of the date.
today.toordinal()  # Outputs: 739377

# Return the day of the week as an integer, where Monday is 0 and Sunday is 6.
today.weekday()  # Outputs: 1

# Return the day of the week as an integer, where Monday is 1 and Sunday is 7.
today.isoweekday()  # Outputs: 2

# Return a named tuple with three components: year, week and weekday.
today.isocalendar()  # Outputs: datetime.IsoCalendarDate(year=2025, week=19, weekday=2)

# Return a string representing the date and time in ISO 8601 format.
# Outputs: '2025-05-06T15:30:43.211380'
today.isoformat(sep='T', timespec='auto')

# Return a string representing the date and time.
today.ctime()  # Outputs: 'Tue May  6 15:30:43 2025'

# Return a string representing the date and time, controlled by an explicit format string.
today.strftime(format_string)  # Outputs: '06/05/2025, 15:30:43'

# time Objects:
"""
A time object represents a (local) time of day, independent of any particular day, 
and subject to adjustment via a tzinfo object.

datetime.time(hour=0, minute=0, second=0, microsecond=0, tzinfo=None, *, fold=0)

All arguments are optional.
"""
# Class attributes:
# The earliest representable time, time(0, 0, 0, 0).
time.min  # Outputs: datetime.time(0, 0)

# The latest representable time, time(23, 59, 59, 999999).
time.max  # datetime.time(23, 59, 59, 999999)

# The smallest possible difference between non-equal time objects.
time.resolution  # datetime.timedelta(microseconds=1)

# Instance attributes (read-only):
just_time = datetime.time(11, 10)

# In range(24).
just_time.hour  # Outputs: 22

# In range(60).
just_time.minute  # Outputs: 50

# In range(60).
just_time.second  # Outputs: 12

# In range(1000000).
just_time.microsecond  # Outputs: 0

# The object passed as the tzinfo argument to the time constructor, or None if none was passed.
just_time.tzinfo

# In [0, 1]. Used to disambiguate wall times during a repeated interval.
just_time.fold  # Outputs: 0

# Class Methods:
# Return a time corresponding to a time_string in any valid ISO 8601 format,
time.fromisoformat('04:23:01')  # Outputs: datetime.time(4, 23, 1)

# Instance methods:
# Return a new time with the same values, but with specified parameters updated.
just_time.replace(
    hour=just_time.hour, minute=just_time.minute, second=just_time.second,
    microsecond=just_time.microsecond, tzinfo=just_time.tzinfo, fold=0
)  # Outputs: datetime.time(11, 10)

time_format = "%H:%M %p"
# Return a string representing the time, controlled by an explicit format string.
just_time.strftime(time_format)  # Outputs: '11:10 AM'

# tzinfo Objects:
# This is an abstract base class, meaning that this class should not be instantiated directly.

# timezone Objects:
"""
The timezone class is a subclass of tzinfo, 
each instance of which represents a time zone defined by a fixed offset from UTC.

datetime.timezone(offset, name=None)
The offset argument must be specified as a timedelta object representing the difference between the local time and UTC.
The name argument is optional. If specified it must be a string that will be used as the value returned by the datetime.tzname() method.
"""


# strftime() and strptime() Behavior:
"""
date, datetime, and time objects all support a strftime(format) method, to create a string representing the time under the control of an explicit format string.
Conversely, the datetime.strptime() class method creates a datetime object from a string representing a date and time and a corresponding format string.
"""

# strftime() and strptime() Format Codes:
"""
1) %a -> Weekday as abbreviated name.   [Sun,Mon,...,Sat]
2) %A -> Weekday as full name.  [Sunday,Monday,...,Saturday]
3) %w -> Weekday as a decimal number, where 0 is Sunday and 6 is Saturday.  [0,1,2,...6]
4) %d -> Day of the month as a zero-padded decimal number.  [01,02,...,31]
5) %b -> Month as abbreviated name.     [Jan,Feb,...,Dec]
6) %B -> Month as full name.    [January,February,...,December]
7) %m -> Month as a zero-padded decimal number.     [01,02,...,12]
8) %y -> Year without century as a zero-padded decimal number.  [00,01,...,99]
9) %Y -> Year with century as a decimal number.     [0001,0002,...,9999]
10) %H -> Hour (24-hour clock) as a zero-padded decimal number.     [00,01,...,23]
11) %I -> Hour (12-hour clock) as a zero-padded decimal number.     [01,02,...,12]
12) %p -> Equivalent of either AM or PM.    [AM,PM]
13) %M -> Minute as a zero-padded decimal number.   [00,01,...,59]
14) %S -> Second as a zero-padded decimal number.   [00,01,...,59]
15) %f -> Microsecond as a decimal number, zero-padded to 6 digits.     [000000,000001,...,999999]
16) %z -> UTC offset in the form ±HHMM[SS[.ffffff]]
17) %Z -> Time zone name (empty string if the object is naive).     [(empty), UTC, GMT]
18) %j -> Day of the year as a zero-padded decimal number.  [001,002,...,366]
19) %U -> Week number of the year (Sunday as the first day of the week).    [00,01,...,53]
20) %W -> Week number of the year (Monday as the first day of the week).    [00,01,...,53]
21) %c -> Local appropriate date and time representation.   [Tue Aug 16 21:30:00]
22) %x -> Local appropriate date representation.    [08/16/1988]
23) %X -> Locale appropriate time representation.   [21:30:00]
24) %% -> A literal '%' character.  [%]
25) %G -> ISO 8601 year with century.   [0001,0002,...,9999]
26) %u -> ISO 8601 weekday as a decimal number.  [1,2,...,7]
27) %V -> ISO 8601 week as decimal number.  [01,02,...,53]
"""
