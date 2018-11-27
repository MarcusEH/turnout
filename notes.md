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

    **** note created validations with begin_time and end_time if you change the column names change this too for user_calendar_openings


11/21/2018
-fix the group.rb find_category logic it's still broken in that a last loop. If there are larger numbers that come after it doesn't bother looking them up. Done.
-change the array to a hash in this file. Done.

11/25/2018 TODO Monday -(pushed to tuesday due to power outage)
-find all places where ids can be replaced with current user method.
-create frontend views for sign up and login 
-create a way for admin to "invite" users to group. possibly sharing group name or id (id seems like it would cause less issues)? 
  -Have a page for updating user_groups via the user's preference page to add the group associated with each user once they "join" a group. How can I make this authorized only? How can I make this just a tab instead of a whole new page?

-change the way the range of dates is found to demand it be over 30 mins or can be selected for the event you pick. something like:
 elapsed_minutes = ((end_time - begin_time) * 24 * 60).to_i
 then compare that to 30 mins? if less thant 30 then keep going if not break?

 ****note REMOVE exception for authentication from groups controller for index action only for texting.