import Foundation

struct Book: Codable, Identifiable {
    let id = UUID()
    let title, subtitle: String
    let authors: [String]
    let categories: [String]?
    let publisher, publishedDate, description: String?
    let pageCount: Int?
    let language: Language?
    let imageLinks: ImageLinks?
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String?
}

enum Language: String, Codable {
    case en = "en"
}

