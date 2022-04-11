

import SwiftUI

struct DeleteButton: View {
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                
                ZStack {
                    Circle()
                        .foregroundColor(Color(.white))
                    
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .scaledToFill()
                        
                }.frame(width: 25, height: 25)
                .padding(8)
            }
            
            Spacer()
        }.frame(height: 145)
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton()
    }
}
