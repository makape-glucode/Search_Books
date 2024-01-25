import SwiftUI

//struct SearchBar: View {
//    @Binding var text: String
//    var onSearchButtonClicked: () -> Void
//
//    var body: some View {
//        HStack {
//            TextField("Search book title", text: $text, onCommit: onSearchButtonClicked)
//                .padding(.horizontal)
//            Button(action: onSearchButtonClicked) {
////                Text("Search")
//                Image(systemName: "magnifyingglass")
//            }
//            
//        }
//        .textFieldStyle(.roundedBorder)
////        .padding()
////        .background(Color.gray.opacity(0.2))
//    }
//}

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search books...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: onSearch) {
                Text("Search")
            }
        }
        .padding()
    }
}
