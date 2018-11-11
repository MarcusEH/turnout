working on user_groups table. 
just fixed association issue on users table with not finding groups by creating migration to rename column to user_groups_id. 
-create GroupEvent model and api controller
-create association for group_events

-format for entering datetime is 'YYYY-MM-DDTHH:MM:SS' with the T left in to separate the date and time ex :"2018-11-11T23:23:23"



json.id user_calendar_opening.id
json.user_id user_calendar_opening.user_id
json.begin_time user_calendar_opening.begin_time
json.end_time user_calendar_opening.end_time

json.array! @user_calendar_openings, partial: 'user_calendar_opening', as: :user_calendar_opening