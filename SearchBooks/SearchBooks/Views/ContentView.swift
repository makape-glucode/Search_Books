import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = BookSearchManager()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onSearch: searchBooks)
                    .padding(.horizontal)

                List(viewModel.searchResults) { book in
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .font(.headline)
                        Text(book.authors.joined(separator: ", "))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("Book Search")
        }
    }

    func searchBooks() {
        viewModel.searchBooks(query: searchText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
