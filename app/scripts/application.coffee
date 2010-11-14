$(document).ready ->
  hour = new Date().getHours()
  greeting = "Good evening."
  if hour < 2
    greeting = "Good night!"
  else if hour < 12
    greeting = "Good morning!"
  else if hour < 18
    greeting = "Good afternoon."
  $('#time_of_day').html(greeting)

$('#mail').live 'click', ->
  $(this).html('<a href="mailto: brandur@mutelight.org">mail at brandur@mutelight.org</a>')

