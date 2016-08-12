# required rows
first_row <- 66638
last_row <- 69517
# column names
column_names <- c('Date',
                  'Time',
                  'Global_active_power',
                  'Global_reactive_power',
                  'Voltage',
                  'Global_intensity',
                  'Sub_metering_1',
                  'Sub_metering_2',
                  'Sub_metering_3')
# column classes
column_classes <- c('character',
                    'character',
                    'numeric',
                    'numeric',
                    'numeric',
                    'numeric',
                    'numeric',
                    'numeric',
                    'numeric')

# read the table
household_pwr <- read.table('household_power_consumption.txt', 
                            sep=';', 
                            skip = first_row - 1,
                            nrows = last_row - first_row + 1,
                            col.name=column_names, 
                            colClasses = column_classes)

# fix date/times
household_pwr$datetime <- strptime(paste(household_pwr$Date, household_pwr$Time), format='%d/%m/%Y %H:%M:%S')

# plot 
png('plot1.png', height=480, width=480)
hist(household_pwr$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()