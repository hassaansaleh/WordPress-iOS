/// Encapsulates logic to mark a comment as spam
class MarkAsSpam: DefaultNotificationActionCommand {
    static let title = NSLocalizedString("Spam", comment: "Marks comment as spam.")
    static let hint = NSLocalizedString("Mark as spam.", comment: "VoiceOver accessibility hint, informing the user the button can be used to Mark a comment as spam.")

    override func action(handler: @escaping UIContextualAction.Handler) -> UIContextualAction? {
        let action = UIContextualAction(style: .normal,
                                        title: MarkAsSpam.title, handler: handler)
        action.backgroundColor = .primary
        return action
    }

    override func execute<ContentType: FormattableCommentContent>(context: ActionContext<ContentType>) {
        let request = NotificationDeletionRequest(kind: .spamming, action: { [weak self] requestCompletion in
            self?.actionsService?.spamCommentWithBlock(context.block) { (success) in
                requestCompletion(success)
            }
        })
        context.completion?(request, true)
    }
}
