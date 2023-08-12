import SwiftUI
struct NotifyListView: View {
    @ObservedObject var itemStore = ItemStore()
    @ObservedObject var refurbFetcher : RefurbFetcher
    @State private var isAddingNewItem = false
    var body: some View {
        NavigationView {
            List{
                ForEach(itemStore.items) { item in
                    NavigationLink {
                        
                        NotifyDetailView(item: item)
                    } label:
                    {
                        Text("\(item.type),\(item.cpu),\(item.memory),\(item.storage),\(item.color),\(item.screensize)")
                    }
                }.onDelete(perform: delete)
            }
            .toolbar {
                EditButton()
            }
            .navigationBarTitle("Notify List")
            .navigationBarItems(trailing: addButton)
            .navigationBarBackButtonHidden(true)
        }.onAppear(perform: {checkProducts()})
        
            .sheet(isPresented: $isAddingNewItem) {
                AddNotifyView(itemStore: itemStore, isPresented: $isAddingNewItem)
            }
    }
    private var addButton: some View {
        SwiftUI.Button(action: {
            isAddingNewItem = true
        }) {
            SwiftUI.Image(systemName: "plus")
        }
    }
    func delete(at offsets: IndexSet) {
        
        itemStore.remove(offSets: offsets)
    }
    
    func checkProducts() {
        for item in itemStore.items{
            for product in refurbFetcher.products{
                if item.memory == product.memory?.rawValue
                {
                    print (product.title)
                }
            }
        }
    }
}
struct NotifyList_Previews: PreviewProvider {
    let refurbFetcher1 = RefurbFetcher()
    static var previews: some View {
        
        NotifyListView(refurbFetcher: .init())
    }
}


