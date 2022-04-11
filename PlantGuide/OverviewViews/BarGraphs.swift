

import SwiftUI

struct BarGraphs: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var selectedPlant: SelectedPlant
    
    let height = Int(UIScreen.main.bounds.height/5.5)
    let blue = Color("blue")
    let darkBlue = Color("darkBlue")
    let yellow = Color("yellow")
    let darkYellow = Color("darkYellow")
    
    //MARK: Gradient Bar Declaration
    func GradientBar(color1: Color, color2: Color, imageName: String, factor: CGFloat)
        -> some View {
            return VStack() {
                ZStack{
                    // background
                    Rectangle()
                        .foregroundColor(Color(colorScheme == .light ? .systemGray2 : .white)).opacity(0.2)
                    
                    // foreground lightmeter
                    VStack{
                        Spacer()
                        
                        LinearGradient(gradient: Gradient(colors: [color1, color2]),startPoint: .top, endPoint: .bottom)
                            .frame(width: 65, height: factor)
                            .cornerRadius(15.0)
                            
                    }
                    // symbol
                    VStack {
                        Spacer()
                        
                        Image(systemName: imageName)
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                    }
                }
            }.frame(width: 65, height: CGFloat(height))
            .cornerRadius(15.0)
        
    }
    
    //MARK: Graphs
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                GradientBar(color1: yellow, color2: darkYellow, imageName: "sun.max.fill", factor: CGFloat(Int(Double(selectedPlant.lightFactor))*height/4))
                
                Spacer()
                
                GradientBar(color1: blue, color2: darkBlue, imageName: "cloud.rain.fill", factor:  CGFloat(Int(Double(selectedPlant.waterFactor))*height/4))
                
                Spacer()
                
                GradientBar(color1: Color(.systemGray2), color2: Color(.systemGray), imageName: "cloud.fog.fill", factor:  CGFloat(Int(Double(selectedPlant.humidityFactor))*height/4))
                
                Spacer()
            }
        }
    }
}

struct BarGraphs_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarGraphs()
                .environmentObject(SelectedPlant())
            BarGraphs()
                .environmentObject(SelectedPlant())
                .preferredColorScheme(.dark)
        }.previewLayout(.fixed(width: 300, height: 300))
    }
}

