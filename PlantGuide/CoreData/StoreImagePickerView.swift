

import SwiftUI

struct storeImagePickerView: View {
    
    @State private var isStoreImagePickerVisible: Bool = false
    @State private var showActionSheet: Bool = false
    @State private var showImageSelector: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State var image: UIImage?
    @Binding var plantID: String
    @Binding var imagePath: String
    @Binding var isRecursive: Bool
    
    var actionSheet: ActionSheet {
        ActionSheet(
         title: Text("Choose your Input:"),
         message: Text("How do you want to scan your plants?"),
            buttons:[
                .default(Text("Take a Photo")){
                    self.showImageSelector = true
                    self.sourceType = .camera
                },
                .default(Text("Photo Library")) {
                    self.showImageSelector = true
                    self.sourceType = .photoLibrary
                },
                .cancel()
        ])
    }
    
    var body: some View {
        HStack {
            
            Text("Select")
                .foregroundColor(.blue)
                .onTapGesture {
                        withAnimation(Animation.easeInOut.delay(1)) {
                            self.showActionSheet = true
                        }
                    }.actionSheet(isPresented: $showActionSheet, content: {
                    self.actionSheet })
                    .sheet(isPresented: $showImageSelector) {
                        ImagePicker(image: self.$image, isStoreImagePickerVisible: self.$showImageSelector, plantID: $plantID, imagePath: $imagePath, isRecursive: $isRecursive, sourceType: self.sourceType).edgesIgnoringSafeArea(.all)
                }
            
            Spacer()
            
            Image(uiImage: ImageStore.retrieve(imageNamed: "\(plantID).jpg") ?? UIImage(named: "placeHolder")!)
                .resizable()
                .cornerRadius(25)
                .frame(width: 100, height: 100)
        }
    }
}

struct storeImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        storeImagePickerView(plantID: Binding.constant("placeHolder"), imagePath: Binding.constant(""), isRecursive: Binding.constant(false))
    }
}
