import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(0..<viewModel.images.count, id: \.self) { index in
                        if index % 4 == 0 {
                            ImageCard(image: viewModel.images[index].image, isWide: true)
                            if index + 3 < viewModel.images.count {
                                HStack(alignment: .top, spacing: 10) {
                                    ImageCard(image: viewModel.images[index+1].image, isTall: true)
                                    
                                    VStack(spacing: 10) {
                                        ImageCard(image: viewModel.images[index+2].image)
                                        ImageCard(image: viewModel.images[index+3].image)
                                    }
                                }
                            }
                        }
                    }
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .padding()
                    }
                }
                .padding(10)
            }
            .navigationTitle("Pinterest")
        }
        Button("Get 5 Images") {
            viewModel.fetchMoreImages()
        }
        .buttonStyle(.bordered)
        .padding()
        .disabled(viewModel.isLoading)
    }
}

struct ImageCard: View {
    let image: Image
    var isWide: Bool = false
    var isTall: Bool = false
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(
                width: isWide ? UIScreen.main.bounds.width - 20 : (UIScreen.main.bounds.width / 2 - 15),
                height: isWide ? 200 : (isTall ? 400 : 200)
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
