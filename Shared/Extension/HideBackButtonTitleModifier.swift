import SwiftUI

struct HideBackButtonTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: EmptyView())
    }
}

extension View {
    func hideBackButtonTitle() -> some View {
        self.modifier(HideBackButtonTitleModifier())
    }
}
