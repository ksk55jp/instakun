class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_picture.subject
  #
  def sendmail_picture(picture)
    @picture=picture
    @greeting = "Hi"

    mail to: "ksk55jp@gmail.com",
      subject: '[Instakun] Pictureが投稿されました'
  end
end
