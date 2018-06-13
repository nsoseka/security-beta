# set the session expiry time
Rails.application.config.session_store :cookie_store, key: 'agent_id', expire_after: 60.minutes

