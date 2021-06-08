import UIKit

extension BlogDetailsViewController {
    func presentBloggingRemindersSettingsFlow() {
        // TODO: Check whether we've already presented this flow to the user. @frosty
        let navigationController = BloggingRemindersNavigationController(rootViewController: BloggingRemindersFlowIntroViewController())

        let bottomSheet = BottomSheetViewController(childViewController: navigationController,
                                                    customHeaderSpacing: 0)
        bottomSheet.show(from: self)
    }
}
