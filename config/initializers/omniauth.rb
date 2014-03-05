OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '194519187415765', 'eeefd8c644d7d9f46e678bbc1ca064c8'
end
