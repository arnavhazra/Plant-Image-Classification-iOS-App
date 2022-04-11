

import SwiftUI

struct NavigationBarTitleView: View {
    var title: String
    
    var body: some View {

        HStack {
            Text(title)
                .font(.system(size: 35))
                .fontWeight(.bold)
                .kerning(-2)
            
            LogoAsset()
                .stroke(lineWidth: 5)
                .frame(width: 35, height: 35)
                .offset(y: -5)
            
            Spacer()
            
        }.offset(y:45)
    }
}


struct NavigationBarTitleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarTitleView(title: "Identify your Plant")
    }
}
