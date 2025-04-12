import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    @Published var images: [ImageModel] = []
    @Published var isLoading = false
    
    private let baseURL = "https://picsum.photos"
    
    func fetchMoreImages() {
        guard !isLoading else { return }
        
        isLoading = true
        
        let group = DispatchGroup()
        var newImages: [ImageModel] = []
        
        let sizes = [
            (width: 1200, height: 600),
            (width: 600, height: 1200),
            (width: 600, height: 600),
            (width: 600, height: 600)
        ]
        
        for size in sizes {
            group.enter()
            let url = "\(baseURL)/\(size.width)/\(size.height)?random=\(UUID().uuidString)"
            
            DispatchQueue.global(qos: .userInitiated).async {
                self.loadImage(url: url, width: size.width, height: size.height) { image in
                    DispatchQueue.main.async {
                        if let image = image {
                            newImages.append(image)
                        }
                        group.leave()
                    }
                }
            }
        }
        
        group.notify(queue: .main) {
            self.images.append(contentsOf: newImages)
            self.isLoading = false
        }
    }
    
    private func loadImage(url: String, width: Int, height: Int, completion: @escaping (ImageModel?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let uiImage = UIImage(data: data) {
                let image = ImageModel(
                    image: Image(uiImage: uiImage),
                    width: CGFloat(width),
                    height: CGFloat(height),
                    url: url.absoluteString
                )
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
