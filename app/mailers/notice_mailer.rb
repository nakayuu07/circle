class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_collection.subject
  #
  def sendmail_collection(collection)
    @collection = collection

    mail to: "@collection.user.email",
       subject: '【collection】新たにイベントが投稿されました'
  end
end
