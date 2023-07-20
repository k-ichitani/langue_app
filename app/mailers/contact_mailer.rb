class ContactMailer < ApplicationMailer
  def contact_mail(contact, student)
    @contact = contact
    mail to: student.email, bcc: ENV["ACTION_MAILER_USER"], subject: "お問い合わせについて【自動送信】"
  end
end
