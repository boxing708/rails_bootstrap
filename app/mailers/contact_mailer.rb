class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: contact.email, subject:"お問い合わせ完了のお知らせ"
  end
end
