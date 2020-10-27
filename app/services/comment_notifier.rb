class CommentNotifier
  attr_reader :comment

  def initialize(comment)
    @comment = comment
  end

  def notify_watchers
    (comment.ticket.watchers.excluding(comment.author)).each do |user|
      CommentMailer
        .new_comment(comment, user)
        .deliver
    end
  end
end
