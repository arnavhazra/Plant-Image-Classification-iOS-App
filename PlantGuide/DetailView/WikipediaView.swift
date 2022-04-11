

import SwiftUI
import SafariServices

struct WikipediaView: View {
    
    @EnvironmentObject var selectedPlant: SelectedPlant

    @Binding var moreInfo: String?
    
    @State var showSafari: Bool = false
    @State var urlString: URL = URL(string: "https://www.apple.com")!
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                CircleIcon(color: Color(.black), image: "text.book.closed.fill")
                    .padding(.trailing, 5)
                
                Text("Wikipedia")
                    .bold()
                    .padding()
            
                Spacer()
                
                Image(systemName: "safari")
                    .foregroundColor(.blue)
                
            }.padding(.trailing)
            }
            .onAppear() {
                print(urlString)
                self.urlString = URL(string: plantData[selectedPlant.id].wikipediaLink)!
            }
            .onTapGesture {
                print(urlString)
                self.urlString = URL(string: plantData[selectedPlant.id].wikipediaLink)!
                            
                    self.showSafari = true

                print(urlString)
            }
            .sheet(isPresented: $showSafari) {
                SafariView(url: URL(string: plantData[selectedPlant.id].wikipediaLink)!)
            }
    }
}

struct WikipediaView_Previews: PreviewProvider {
    static var previews: some View {
        WikipediaView(moreInfo: Binding.constant(nil))
            .environmentObject(SelectedPlant())
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }
}
