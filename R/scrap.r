numberOfTransmissionEventsPerYear = 1

obsSampleSize <- c(2, 0, 3, 0, 21, 0, 21, 0, 56, 54, 0, 30, 41, 52)  #this includes zeros for artificial 'gap' timeblocks

startDates <- c(3700, 3600, 3450, 3450, 3200, 3200, 3100, 3100, 3050, 3010,
                2930, 2850, 2750, 2600)

endDates <- c(3600, 3450, 3450, 3200, 3200, 3100, 3100, 3050, 3010, 2930,
              2850, 2750, 2600, 1650)
transmissionEvents <- (startDates - endDates)/numberOfTransmissionEventsPerYear
# notice that the numnbe

start <- numeric()
end <- numeric()

timesteps = 1

for (x in 1:length(obsSampleSize))
{
  start[x] = timesteps
  if (transmissionEvents[x] > 0)
  {SEQ <- seq.int(timesteps, length.out = transmissionEvents[x])}
  #notice that the number of transmission events is rounded by the seq.int() function
  else {SEQ = timesteps
  }
  end[x] = SEQ[length(SEQ)]
  timesteps = end[x]
  if (transmissionEvents[x]>0)
  {timesteps=timesteps+1
  }
}

startend <- data.frame(start = start, end = end)
