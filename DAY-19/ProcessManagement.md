# Process management in Linux

A process in Linux is nothing but a program in execution. It’s a running instance of a program. Any command that you execute starts a process.

## Types of Processes in Linux

In Linux processes can be of two types:

1. Foreground Processes
   depend on the user for input
   also referred to as interactive processes.

2. Background Processes
   run independently of the user
   referred to as non-interactive or automatic processes.

## Process States in Linux

A process in Linux can go through different states after it’s created and before it’s terminated.  
These states are:

- Running
- Sleeping

  - Interruptible sleep
  - Uninterruptible sleep

- Stopped

- Zombie

- A process in running state means that it is running or it’s ready to run.

- The process is in a sleeping state when it is waiting for a resource to be available.

- A process in Interruptible sleep will wakeup to handle signals, whereas a process in Uninterruptible sleep will not.

- A process enters a stopped state when it receives a stop signal.

- Zombie state is when a process is dead but the entry for the process is still present in the table.

## Different Commands for Process Management in Linux

There are two commands available in Linux to track running processes. These two commands are `top` and `ps`.

1. `top`

To track the running processes on your machine you can use the top command.

2. `ps`

`ps` command is short for ‘Process Status’. It displays the currently-running processes. However, unlike the top command, the output generated is not in realtime.

3. `kill`

To stop a process in Linux, use the `kill` command. `kill` command sends a signal to the process.

`kill [pid]`

4. Checking process tree

`pstree`

5. Manage processes

`sudo systemctl start|stop [process name]`

6. Checking the status of the process

`sudo systemctl status [process name]`

7. Restarting the process

`sudo systemctl restart [process name]`

8. Checking the process enabled or not

`sudo systemctl is-active [process name]`

9. Checking the process is enabled or not at startup

`sudo systemctl is-enabled [process name]`
