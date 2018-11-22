make associations for user_calendar_openings table - make association with group to fix loops.
-make sure associations are working
-research google api (fullCalendar)
-practice making a basic non-google calendar in a new app (scratch - fullCalendar)
figure out how you would write your own version of the calendar example (don't want to copy code!)
-make some additional sample data
-create more range examples to test logic for time slot in group_events 
-create and comment out authentication
-think about how you want to display your data points... are they currently set up properly... range vs specific points...


Outside:
-look up some styling ...



KEEPER NOTES
-format for entering datetime is 'YYYY-MM-DDTHH:MM:SS' with the T left in to separate the date and time ex :"2018-11-11T23:23:23"

Asset org - from the rails guide at rubyonrails.org:
"app/assets is for assets that are owned by the application, such as custom images, JavaScript files or stylesheets.

lib/assets is for your own libraries' code that doesn't really fit into the scope of the application or those libraries which are shared across applications.

vendor/assets is for assets that are owned by outside entities, such as code for JavaScript plugins and CSS frameworks. Keep in mind that third party code with references to other files also processed by the asset Pipeline (images, stylesheets, etc.), will need to be rewritten to use helpers like asset_path."


   "id": 2,
    "user_id": 2,
    "begin_time": "Friday, 23 Nov 2018  8:00 PM",
    "end_time": "Saturday, 24 Nov 2018 12:00 PM"

    **** note created validations with begin_time and end_time if you change the column names change this too for user_calendar_openigns


  # https://stackoverflow.com/questions/7325124/how-check-intersection-of-datetime-periods


11/21/2018
-fix the group.rb find_category logic it's still broken in that a last loop. If there are larger numbers that come after it doesn't bother looking them up.
-change the array to a hash in this file