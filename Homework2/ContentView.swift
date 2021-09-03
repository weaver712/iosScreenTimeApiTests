import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: MyModel
    @State private var isPresented = false
    
    var body: some View {
        // Show the family activity picker and allow the guardian to chose from a list of apps, websites, and categories used by the family (currently limited to 50)
        // Once the guardian has made their selection, Homework can use opaque tokens returned by the picker to set restrictions on apps, websites, and categories each token represents.
        // Here I've added the familyPickerActivityPicker view modifier to a Button in the app
        // and I've bound the picker's selection parameter to a property in the app's model
        // This will update my model whenever the guardian's selection is updated in the UI
        Button("Select Apps to Discourage") {
            isPresented = true
        }
        .familyActivityPicker(isPresented: $isPresented, selection: $model.selectionToDiscourage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MyModel())
    }
}
