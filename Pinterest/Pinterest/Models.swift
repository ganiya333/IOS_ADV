import SwiftUI

struct ImageModel: Identifiable {
    let id = UUID()
    let image: Image
    let width: CGFloat
    let height: CGFloat
    let url: String
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
