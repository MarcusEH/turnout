json.array! @groups_events do |group_event|
  json.title group_event.event_name
  json.location group_event.location
  json.start group_event.begin_time
  json.end group_event.end_time
end