import SwiftUI
struct NotifyListView: View {
    @ObservedObject var itemStore = ItemStore()
    @State private var isAddingNewItem = false
    var body: some View {
        NavigationView {
            List{
                ForEach(itemStore.items) { item in
                    NavigationLink {
                        
                        NotifyDetailView(item: item)
                    } label:
                    {
                        Text(item.name)
                    }
                }.onDelete(perform: delete)
            }
            .toolbar {
                EditButton()
            }
            .navigationBarTitle("Notify List")
            .navigationBarItems(trailing: addButton)
        }
        
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
}


