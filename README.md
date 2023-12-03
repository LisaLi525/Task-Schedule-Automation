# Task Schedules Management

This R script utilizes the `taskscheduleR` package to manage and schedule recurring tasks in a Windows environment. It sets up tasks for running R scripts at specified intervals using the Windows Task Scheduler.

## Prerequisites

Make sure to install the required R package before running the script:

```r
install.packages("taskscheduleR")
```

## Task Schedule Creation

The script includes code for creating various scheduled tasks:

1. **One-Time Daily Task**
   - Task Name: `Schedule_Task_Daily`
   - Execution: Once, scheduled for 1 minute from the current time.
   - R Script: `Scheduled_Report_Daily.R`

```r
taskscheduler_delete(taskname = "Schedule_Task_Daily")
runon <- format(Sys.time() + 60, "%H:%M")
taskscheduler_create(taskname = "Schedule_Task_Daily", rscript = "C:/Users/example/Desktop/R_Schedule_Reports/Scheduled_Report_Daily.R", 
 schedule = "ONCE", starttime = runon)
```

2. **One-Time Weekly Task**
   - Task Name: `Schedule_Task_Weekly`
   - Execution: Once, scheduled for 2 minutes from the current time.
   - R Script: `Scheduled_Report_Weekly.R`

```r
taskscheduler_delete(taskname = "Schedule_Task_Weekly")
runon <- format(Sys.time() + 120, "%H:%M")
taskscheduler_create(taskname = "Schedule_Task_Weekly", rscript = "C:/Users/example/Desktop/R_Schedule_Reports/Scheduled_Report_Weekly.R", schedule = "ONCE", starttime = runon)
```

3. **Daily Scheduled Task**
   - Task Name: `Daily_Schedule_Task`
   - Execution: Daily at 08:50, starting from tomorrow.
   - R Script: `Scheduled_Report_Daily.R`

```r
taskscheduler_create(taskname = "Daily_Schedule_Task", rscript = "C:/Users/example/Desktop/R_Schedule_Reports/Scheduled_Report_Daily.R", 
 schedule = "DAILY", starttime = "08:50", startdate = format(Sys.Date() + 1, "%d/%m/%Y"))
```

## Note
Replace sensitive information such as file paths, task names, and execution times with your actual data before running the script. Ensure that the specified R scripts exist in the provided paths.

In this README, replace instances of "example" with your actual company details, and ensure that the specified R scripts exist in the provided paths before running the script.
