import SwiftUI

struct FilterView: View {
    @Binding  var selectedItemCpu: String
    var productFilterCpu: [String] = ["M1","M2"]
    @Binding  var selectedItemMemory: String
    var productFilterMemory: [String] = ["8gb","16gb","24gb","32gb","64gb"]
    @Binding  var selectedItemType: String
    var productFilterType: [String] = ["mac","ipad"]
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack{

                HStack{
                    Text("Type:")
                        .padding()
                    Picker("", selection: $selectedItemType)
                    {
                        ForEach(productFilterType, id: \.self)
                        {
                            
                            filter in
                            Text(filter)
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                }
                HStack{
                    Text("Cpu:").padding()
                    Picker("", selection: $selectedItemCpu)
                    {
                        
                        ForEach(productFilterCpu, id: \.self)
                        {
                            
                            filter in
                            Text(filter)
                        }
                    }

                    .disabled(selectedItemType == "ipad")
                    .pickerStyle(SegmentedPickerStyle())
                }
                HStack{
                    Text("Memory:").padding()
                    Picker("", selection: $selectedItemMemory)
                    {
                        ForEach(productFilterMemory, id: \.self)
                        {
                            filter in
                            Text(filter)
                        }
                    }
                    .disabled(selectedItemType == "ipad")
                    .pickerStyle(SegmentedPickerStyle())

                    
                }
                HStack{
                    Text("Close").frame(width: 300.0, height: 50.0).background(Color.blue.cornerRadius(10)).foregroundColor(.white).onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
             .navigationBarTitle("Filter")
        }
    }
}
