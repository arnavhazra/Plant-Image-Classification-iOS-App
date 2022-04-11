

import SwiftUI

struct ScanResultPreview: View {
    @EnvironmentObject var selectedPlant: SelectedPlant
    
    @State private var showDetails: Bool = false
    
    @Binding var classificationLabel: Array<Int>
    
    var body: some View {
        VStack {
            if classificationLabel.isEmpty {
                ResultPreview(selected: Binding.constant(999))
            } else {
            
            ForEach(classificationLabel, id: \.self) {x in
                ResultPreview(selected: Binding.constant(x))
                    .buttonStyle(PlainButtonStyle())
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            updateAllValues(id: x)
                            showDetails = true
                        }
                    }
                }.sheet(isPresented: $showDetails, content: {
                    PlantDetail()
                })
            }
        }
    }
    func updateAllValues(id: Int) {
        selectedPlant.id = plantData[id].id
        selectedPlant.name = plantData[id].name
        selectedPlant.latin = plantData[id].latin
        selectedPlant.lightFactor = plantData[id].lightFactor
        selectedPlant.waterFactor = plantData[id].waterFactor
        selectedPlant.humidityFactor = plantData[id].humidityFactor
        selectedPlant.description = plantData[id].description
        selectedPlant.imageName = plantData[id].imageName
    }
}

struct ScanResultPreview_Previews: PreviewProvider {
    static var previews: some View {
        ScanResultPreview(classificationLabel: Binding.constant([1,2]))
            .environmentObject(SelectedPlant())
    }
}
