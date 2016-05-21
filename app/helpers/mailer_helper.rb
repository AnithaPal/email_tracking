module MailerHelper
  def track(email)
    url = "#{Rails.application.routes.url_helpers.root_path(:only_path => false)}email/track/#{Base64.encode64("email=#{email}")}.png"
    raw("<img src=\"#{url}\" alt=\"opened\" title=\"Logo\" style=\"display:block\" width=\"20\" height=\"20\">")
  end
end
