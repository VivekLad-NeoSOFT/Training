# CronJob

## What Is a Cron Job?

A **Cron Job** is a Linux program that allows users to schedule the execution of a piece of software, often in the form of a shell script or a compiled executable. Cron is typically used when you have a task that needs to be run on a fixed schedule, and/or to automate repetitive tasks like downloading files or sending emails.

At its most basic level, a **cron job** is an entry written into a table called the cron table, otherwise known as the crontab for short. This entry contains a schedule and a command to be executed. The **cron daemon** (crond) looks for entries in the **crontab** to determine what jobs it should run, and when it should run them according to the specified schedule.

## How Do Cron Jobs Work?

Most standard installations of cron consists of two commands:

- **cron** or **crond**, which is the daemon that runs the scheduling utility
- **crontab**, which is the command that allows you to edit the cron entries for your jobs

When you talk about a daemon from a Linux perspective, it’s a program that is running in the background and is noninteractive. This means that the program does not accept any user input and doesn’t display output to the user. The word daemon is historically used in a Unix/Linux context and is not a universal term across different operating systems.

You can run the following command to see if cron is running:

`ps aux | grep cron`

## Cron Job Schedule Syntax

```
*    *    *    *    *   /home/user/bin/somecommand.sh
|    |    |    |    |            |
|    |    |    |    |    Command or Script to execute
|    |    |    |    |
|    |    |    | Day of week(0-6 | Sun-Sat)
|    |    |    |
|    |    |  Month(1-12)
|    |    |
|    |  Day of Month(1-31)
|    |
|   Hour(0-23)
|
Min(0-59)

```

An asterisk (\*) matches all values, so if you take a look at the example above, it specifies that **/home/user/bin/somecommand.sh** should be run at **minutes 0-59** and **hours 0-23** on days of the **month 1-31** for **months 1-12** on days of **week 0-6** — or in other words "**every minute**".

1. You can add a cron job using following command for current user

`crontab -e`

2. Adding cron job for a specific user

`sudo crontab -u [user name] -e`

3. Checking running Cron jobs

`$ cat /var/log/syslog | grep CRON`
