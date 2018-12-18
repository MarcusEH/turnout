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

 
-create a way for admin to "invite" users to group. possibly sharing group name or id (id seems like it would cause less issues)? 
  -Have a page for updating user_groups via the user's preference page to add the group associated with each user once they "join" a group. How can I make this authorized only? How can I make this just a tab instead of a whole new page?

-change the way the range of dates is found to demand it be over 30 mins or can be selected for the event you pick. something like:
 elapsed_minutes = ((end_time - begin_time) * 24 * 60).to_i
 then compare that to 30 mins? if less thant 30 then keep going if not break?

 11/28/2018
 
 -event_type from groups is still blank what do i want here?
  -should this match the find_category? should just send through json?
 -group_event_id from groups is still blank what do I want here?
  -possibly for "nice to have" of specific events.

  -do i want the user destroy action to actually destroy users? possibly create another column "status" active or inactive for hiding and showing users?

  -for update action for usergroups what do i really want this to do? 
    -do i want end users to be able to actually move users from one group to another? no. maybe just destroy action to destroy the association of a user between one group.

     

*** creating a group should set the user admin == true... need to actually make this happen


11/28/2018
EVENING 
-Need to create logic limiters however. 


12/5/2018
-create a way for interests to populate when users signup/create. Default the values to 0. Still need logic to limit the values. (not super essential)
-create info for show page for groups
-create edit page for groups.
-create image_url column for groups

-find a theme and install it.
-if i want to use fullcalendar-scheduler I still need to install it. the import commands are commented out in the main.js
-look up some examples.






******


12/07/2018
-backend comments and invites done ready for front end.
-finished group show vue.

-next step: connect backend and to front end for signup with groups. modal?
-pick a theme that will work with this.

12/08/2018
-comments frontend linked for creating and viewing on groupshow
  -still need delete (nice to have? lol)

  -fandango api or imdb
12/09/2018
-installing theme. working on nav bar on index page.

12/11/2018
-theme mostly installed issues with group show page. Members are popping out of the box. Maybe just remove the box? Don't waste time on this. If it's not working move on.
-Need to look for the fandango api.
-add the images tables for users and group
  -currently the registration page and edit page for user is      uploading a file not adding an image url.
-finish installing the theme: go faster.

12/14/2018


 
  
-make seeds faker data for movies, etc.. can't find an api. all cost money or don't have what I need unfortunately. 


-issue with group edit page errors for group info? 
working on fixing group images. not linked between group image table and group table.
  -add to group table -group_image_id and then add the post request if group_image doesn't exist to the group edit page.