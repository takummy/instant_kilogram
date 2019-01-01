class PostInfoMailer < ApplicationMailer
  default from: 'post@example.com'
  layout 'mailer'

  def notification_mail(user)
    @user = user
    mail to: "#{@user.email}", subject: "投稿確認"
  end
end