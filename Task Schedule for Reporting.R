# Install the required package
install.packages("taskscheduleR")

# Load the taskscheduleR package
library(taskscheduleR)

# Function to create a one-time task
create_one_time_task <- function(taskname, rscript_path, offset_minutes) {
  taskscheduler_delete(taskname = taskname)
  runon <- format(Sys.time() + offset_minutes * 60, "%H:%M")
  taskscheduler_create(taskname = taskname, rscript = rscript_path, 
                       schedule = "ONCE", starttime = runon)
}

# Function to create a daily recurring task
create_daily_task <- function(taskname, rscript_path, start_time, start_date_offset) {
  taskscheduler_delete(taskname = taskname)
  taskscheduler_create(taskname = taskname, rscript = rscript_path, 
                       schedule = "DAILY", starttime = start_time, 
                       startdate = format(Sys.Date() + start_date_offset, "%d/%m/%Y"))
}

# Function to create additional tasks
create_additional_tasks <- function() {
  # ... [Code for creating additional tasks]
}

# Function to delete tasks
delete_tasks <- function(tasknames) {
  lapply(tasknames, taskscheduler_delete)
}

# Create one-time tasks
create_one_time_task("Schedule_Task_Daily", "C:/Users/example/Desktop/R_Schedule_Reports/Scheduled_Report_Daily.R", 1)
create_one_time_task("Schedule_Task_Weekly", "C:/Users/example/Desktop/R_Schedule_Reports/Scheduled_Report_Weekly.R", 2)

# Create daily recurring task
create_daily_task("Daily_Schedule_Task", "C:/Users/example/Desktop/R_Schedule_Reports/Scheduled_Report_Daily.R", "08:50", 1)

# Ready-to-go Code
create_additional_tasks()

# Delete tasks
delete_tasks(c("Daily_Schedule_Task", "myfancyscript_sun", 
               "myfancyscript_5min", "myfancyscript_withargs_a", 
               "myfancyscript_withargs_b"))

# View all tasks
alltasks <- taskscheduler_ls()
alltasks
