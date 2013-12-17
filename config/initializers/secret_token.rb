require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

LkApp::Application.config.secret_key_base = 'b2eeb053268bf844065aa4b0100f0ab50554706e87db9c6eff11c17f9747596733a9dcfc6014d9f5a72ea610e74ee27e3996c109e6e7ea8102a5da8eef8cc0f7'

