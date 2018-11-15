var initializeCalendar;
initializeCalendar = function() {
  $('.calendar').each(function() {
    var calendar = $(this);
    calendar.fullCalendar({});
  });
};
$(document).on('turbolinks:load', initializeCalendar);
