ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
  :openssl_verify_mode  => OpenSSL::SSL::VERIFY_NONE,
  :address              => "mail.engineer.org.in",
  :port                 => 26,
  :domain               => "www.engineer.org.in",
  :user_name            => "ectf@engineer.org.in",
  :password            => "ectf@NiTk2014",
  :authentication       => :login,
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "www.engineer.org.in"

