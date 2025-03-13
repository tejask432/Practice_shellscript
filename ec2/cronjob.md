Create A cron job
> sudo crontab -e

View the jobs
>sudo crontab -l
________________________________________________________

Basic structure for a crontab entry

* * * * * command_to_run
- - - - -
| | | | | 
| | | | +---- Day of the week (0 - 7) [0 and 7 represent Sunday]
| | | +------ Month (1 - 12)
| | +-------- Day of the month (1 - 31)
| +---------- Hour (0 - 23)
+------------ Minute (0 - 59)

example:

Commmand to run the job daily at 8am except sunday

0 8 * * 0-6 /home/ubuntu/test.sh >/dev/job.logs 2>&1

______________________________________________________________