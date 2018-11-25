make associations for user_calendar_openings table - make association with group to fix loops.
-make sure associations are working
-research google api (fullCalendar)
-make some additional sample data
-create more range examples to test logic for time slot in group_events 
-create and comment out authentication
-think about how you want to display your data points... are they currently set up properly... range vs specific points...


Outside:
-look up some styling ...



KEEPER NOTES
-format for entering datetime is 'YYYY-MM-DDTHH:MM:SS' with the T left in to separate the date and time ex :"2018-11-11T23:23:23"

   "id": 2,
    "user_id": 2,
    "begin_time": "Friday, 23 Nov 2018  8:00 PM",
    "end_time": "Saturday, 24 Nov 2018 12:00 PM"

    **** note created validations with begin_time and end_time if you change the column names change this too for user_calendar_openigns


  # https://stackoverflow.com/questions/7325124/how-check-intersection-of-datetime-periods


11/21/2018
-fix the group.rb find_category logic it's still broken in that a last loop. If there are larger numbers that come after it doesn't bother looking them up. Done.
-change the array to a hash in this file. Done.