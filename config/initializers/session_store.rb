# Be sure to restart your server when you modify this file.

Webshop::Application.config.session_store :cookie_store,
                                          key: '_webshop_session',
                                          secure: ::APP_CONFIG.secure_cookie

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Webshop::Application.config.session_store :active_record_store
