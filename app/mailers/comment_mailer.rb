class CommentMailer < ApplicationMailer
  default from: 'noreply.auxvillages@gmail.com'

  def comment_email
    @comment = params[:comment]
    @url  = 'https://auxvillageslarepublique.com/admin'
    mail(to: "famrltest@gmail.com", subject: "Nouveau commentaire sur le blog")
  end
end
