# Linux Commands

Essential Linux commands

31. du

To check the size of a directory and its content, use the du command.
The command will check your working directory if you don’t specify a path or folder. By default, it breaks down each subfolder’s disk usage, but you can add the -s option to summarize the total usage in one output.  
You can also use the -m option to change the information from KB to MB.

`du [directory]`

32. top

The top command displays all running processes in your system and their hardware consumption.

`top [options]`

33. htop

Like top, the htop command lets you display and manage processes in your Linux server.

`htop [options]`

34. ps

The ps command summarizes the status of all running processes.

`ps [options]`

35. hostname

Use the hostname command to check your VPS hostname and other related information.

`hostname [options]`

36. systemctl

The systemctl command is used to manage services in your Linux system.

`systemctl subcommand [service_name][options]`

37. kill

Use the kill command to terminate a process using its ID.

`kill [signal_option] Process_ID`

38. shutdown

The shutdown command lets you turn off or restart your Linux system at a specific time.

`shutdown [option] [time] [message]`

39. ping

The ping command sends packets to a target server and fetches the responses. It is helpful for network diagnostics.  
However, you can specify a custom number using the -c option. You can also change the interval between transfers by adding -i.

`ping [option] [hostname_or_IP_address]`

40. wget

The wget command lets you download files from the internet via HTTP, HTTPS, or FTP protocols.

`wget [options] [URL]`

41. curl

Use the cURL command to transfer data from or to a server by specifying its URL.

`curl [options] URL`

42. scp

The scp command lets you securely copy files and directories between systems over a network.

`scp [option] [source username@IP]:/[directory and file name] [destination username@IP]:/[destination directory]`

43. rsync

The rsync command syncs files or folders between two destinations to ensure they have the same content.

`rsync [options] source destination`

44. ip

The ip utility lets you list and manage your system’s network parameters.

`ip [options] object command`

45. netstat

The netstat command displays information about your system’s network configuration.
Add an option to query specific network information. Here are several flags to use:

- `-a` – displays listening and closed sockets.
- `-t` – shows TCP connections.
- `-u` – lists UDP connections.
- `-r` – displays routing tables.
- `-i` – shows information about network interfaces.
- `-c` – continuously outputs network information for real-time monitoring.

`netstat [options]`

46. traceroute

The traceroute command tracks a packet’s path when traveling between hosts, providing information like the transfer time and involved routers.

`traceroute [options] destination`

47. nslookup

The nslookup command requests a domain name system (DNS) server to check a domain linked to an IP address or vice versa.

`nslookup [options] domain-or-ip [dns-server]`

48. history

Run the history command to check previously run utilities.

`history [options]`

49. man

The man or manual command displays a comprehensive guide of another utility.

`man [options] [section_number] command_name`

50. echo

Use echo to print text in your command as a Terminal output.  
You can also add the redirection symbol (>) to print the text in a file instead of Terminal. If you use two symbols (>>), it will append the existing content.

`echo [options] [text]`

51. ln

The ln command links files or directories with a shortcut.

`ln [options] source target`

52. cal

The cal command displays a calendar in your Linux command-line interface.

`cal [options] [month] [year]`

53. apt

The apt command lets you manage advanced package tool.

`apt [options] subcommand`
