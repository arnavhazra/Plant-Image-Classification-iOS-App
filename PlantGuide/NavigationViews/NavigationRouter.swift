

import SwiftUI

class NavigationRouter: ObservableObject {
    
    @Published var currentPage: Page = .homePage
    
}

enum Page {
    case homePage
    case scanPage
    case overViewPage
}
