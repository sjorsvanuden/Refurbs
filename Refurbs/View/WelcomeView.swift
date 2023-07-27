import SwiftUI

struct WelcomeView: View {
    @State var selectedCountry:String = "de"
    let countries = ["de", "nl"]

    var body: some View {
        NavigationStack{
            VStack() {
                SwiftUI.Image(uiImage: UIImage(named: "refurb2")!)// Replace "earth_shopping_icon" with the name of your image asset
                    //.resizable()
                    .frame(width: 325, height: 325)
                    .clipShape(Circle())
                    .padding()

                HStack{
                    Text("Store Country")
                        .padding()
                        .font(.system(size: 16))
                    Picker("Select Country", selection: $selectedCountry) {
                        ForEach(countries, id: \.self) { country in
                            Text(country)
                        }
                    }.pickerStyle(.segmented)
                        .padding()
                }
                NavigationLink{
                    MainView(selectedCountry: $selectedCountry)
                }
            label: {
                Text("Continue").frame(width: 325.0, height: 50.0).background(Color.blue.cornerRadius(10)).foregroundColor(.white)
            }

                    }
                    .font(.footnote)
                    .foregroundColor(.black)
                    .navigationBarTitle("Refurbs")
                }
                .padding()

            }
        }


