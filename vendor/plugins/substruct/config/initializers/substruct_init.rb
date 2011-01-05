# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
# Substruct Globals
ERROR_EMPTY  = 'Please fill in this field.'
ERROR_NUMBER = 'Please enter only numbers (0-9) in this field.'

## Substruct Init (TODO: Make this into a config/initializer) ##
begin
  # Preference.init_mail_settings()
rescue
  puts "[SUBSTRUCT-MAILER WARNING 2010]"
  puts "Mail server settings have not been initialized."
  puts "Check to make sure they've been set in the admin panel."
  # Don't care if this bombs out, because initially this won't have a value.
end
