//import Foundation
//
//class BookSearchManager {
//    let baseURL = "https://www.googleapis.com/books/v1/volumes?q="
//
//    func searchForBooksByTitle(title: String, completion: @escaping (SearchBooks?) -> Void) {
//        let searchTerm = title.replacingOccurrences(of: " ", with: "+")
//        let urlString = baseURL + searchTerm
//
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            completion(nil)
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                completion(nil)
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                completion(nil)
//                return
//            }
//
//            do {
//                let searchResult = try JSONDecoder().decode(SearchBooks.self, from: data)
//                completion(searchResult)
//            } catch {
//                print("JSON decoding error: \(error.localizedDescription)")
//                completion(nil)
//            }
//        }.resume()
//    }
//}

//import Foundation
//
//class BookSearchManager {
//    let baseURL = "https://www.googleapis.com/books/v1/volumes?q="
//
//    func searchForBooksByTitle(title: String, completion: @escaping (SearchBooks?) -> Void) {
//        let searchTerm = title
//        let urlString = baseURL + searchTerm
//
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            completion(nil)
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                completion(nil)
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                completion(nil)
//                return
//            }
//
//            do {
//                let searchResult = try JSONDecoder().decode(SearchBooks.self, from: data)
//                let filteredSearchResult = self.filterSearchResults(searchResult, withTitle: title)
//                completion(filteredSearchResult)
//            } catch {
//                print("JSON decoding error: \(error.localizedDescription)")
//                completion(nil)
//            }
//        }.resume()
//    }
//
//    private func filterSearchResults(_ searchResult: SearchBooks?, withTitle title: String) -> SearchBooks? {
//        guard let items = searchResult?.items else {
//            return nil
//        }
//
//        let filteredItems = items.filter { $0.volumeInfo?.title?.localizedCaseInsensitiveContains(title) == true }
//        return SearchBooks(kind: searchResult!.kind, totalItems: searchResult!.totalItems, items: filteredItems)
//    }
//}

import SwiftUI

class BookSearchManager: ObservableObject {
    @Published var searchResults: [Book] = []

    func searchBooks(query: String) {
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }

        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(encodedQuery)"
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                return
            }

            do {
                let searchBooks = try JSONDecoder().decode(SearchBooks.self, from: data)
                DispatchQueue.main.async {
                    self.searchResults = searchBooks.items?.compactMap { $0.volumeInfo }.map { volumeInfo in
                        Book(
                            title: volumeInfo.title ?? "",
                            authors: volumeInfo.authors ?? [],
                            categories: volumeInfo.categories,
                            publisher: volumeInfo.publisher,
                            publishedDate: volumeInfo.publishedDate,
                            description: volumeInfo.description,
                            pageCount: volumeInfo.pageCount,
                            language: volumeInfo.language,
                            imageLinks: volumeInfo.imageLinks
                        )
                    } ?? []
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
