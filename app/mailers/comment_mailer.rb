class CommentMailer < ApplicationMailer
  def new_comment_email
  @message = params[:comment]

  mail(to: "contact@fannymaurel.com", subject: "Nouveau commentaire sur le blog")
  end
end
