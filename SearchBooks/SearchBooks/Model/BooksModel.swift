// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchBooks = try? JSONDecoder().decode(SearchBooks.self, from: jsonData)

import Foundation

// MARK: - SearchBooks
struct SearchBooks: Codable {
    let kind: String?
    let totalItems: Int?
    let items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let kind: Kind?
    let id, etag: String?
    let selfLink: String?
    let volumeInfo: VolumeInfo?
    let saleInfo: SaleInfo?
    let accessInfo: AccessInfo?
    let searchInfo: SearchInfo?
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    let country: Country?
    let viewability: Viewability?
    let embeddable, publicDomain: Bool?
    let textToSpeechPermission: TextToSpeechPermission?
    let epub, pdf: Epub?
    let webReaderLink: String?
    let accessViewStatus: AccessViewStatus?
    let quoteSharingAllowed: Bool?
}

enum AccessViewStatus: String, Codable {
    case none = "NONE"
    case sample = "SAMPLE"
}

enum Country: String, Codable {
    case za = "ZA"
}

// MARK: - Epub
struct Epub: Codable {
    let isAvailable: Bool?
    let acsTokenLink: String?
}

enum TextToSpeechPermission: String, Codable {
    case allowed = "ALLOWED"
}

enum Viewability: String, Codable {
    case noPages = "NO_PAGES"
    case partial = "PARTIAL"
}

enum Kind: String, Codable {
    case booksVolume = "books#volume"
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    let country: Country?
    let saleability: Saleability?
    let isEbook: Bool?
    let listPrice, retailPrice: SaleInfoListPrice?
    let buyLink: String?
    let offers: [Offer]?
}

// MARK: - SaleInfoListPrice
struct SaleInfoListPrice: Codable {
    let amount: Double?
    let currencyCode: CurrencyCode?
}

enum CurrencyCode: String, Codable {
    case zar = "ZAR"
}

// MARK: - Offer
struct Offer: Codable {
    let finskyOfferType: Int?
    let listPrice, retailPrice: OfferListPrice?
}

// MARK: - OfferListPrice
struct OfferListPrice: Codable {
    let amountInMicros: Int?
    let currencyCode: CurrencyCode?
}

enum Saleability: String, Codable {
    case forSale = "FOR_SALE"
    case notForSale = "NOT_FOR_SALE"
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String?
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let industryIdentifiers: [IndustryIdentifier]?
    let readingModes: ReadingModes?
    let printType: PrintType?
    let averageRating: Double?
    let ratingsCount: Int?
    let maturityRating: MaturityRating?
    let allowAnonLogging: Bool?
    let contentVersion: String?
    let panelizationSummary: PanelizationSummary?
    let previewLink: String?
    let infoLink: String?
    let canonicalVolumeLink: String?
}

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    let type: TypeEnum?
    let identifier: String?
}

enum TypeEnum: String, Codable {
    case isbn10 = "ISBN_10"
    case isbn13 = "ISBN_13"
}

enum MaturityRating: String, Codable {
    case notMature = "NOT_MATURE"
}

// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool?
}

enum PrintType: String, Codable {
    case book = "BOOK"
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    let text, image: Bool?
}
