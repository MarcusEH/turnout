-make sure associations are working
-research google api (fullCalendar)
-make some additional sample data
-create more range examples to test logic for time slot in group_events 


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
DONE

11/25/2018 TODO Monday -(pushed to tuesday due to power outage)
-find all places where ids can be replaced with current user method. (done for: users, user_interests, user_groups, user_calendar_openings, groups)*** GROUP EVENTS NEEDS WORK

-create frontend views for sign up and login 
-create a way for admin to "invite" users to group. possibly sharing group name or id (id seems like it would cause less issues)? 
  -Have a page for updating user_groups via the user's preference page to add the group associated with each user once they "join" a group. How can I make this authorized only? How can I make this just a tab instead of a whole new page?

-change the way the range of dates is found to demand it be over 30 mins or can be selected for the event you pick. something like:
 elapsed_minutes = ((end_time - begin_time) * 24 * 60).to_i
 then compare that to 30 mins? if less thant 30 then keep going if not break?

 11/28/2018
 -Remember to remove users index action it is not necessary for the app and not something end users should have access to.
 -event_type from groups is still blank what do i want here?
  -should this match the find_category? should just send through json?
 -group_event_id from groups is still blank what do I want here?
  -possibly for nice to have of specific events.

  -do i want the user destroy action to actually destroy users? possibly create another column "status" active or inactive for hiding and showing users?

  -for update action for usergroups what do i really want this to do? 
    -do i want end users to be able to actually move users from one group to another? no. maybe just destroy action to destroy the association of a user between one group.

     

*** creating a group should set the user admin == true... need to actually make this happen