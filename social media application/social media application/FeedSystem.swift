import Foundation

class FeedSystem {
    private var userCache: [String: UserProfile] = [:]
    private var feedPosts: [Post] = []
    private var hashtags: Set<String> = []

    func addPost(_ post: Post) {
        feedPosts.insert(post, at: 0)
        let postHashtags = extractHashtags(from: post.content)
        hashtags.formUnion(postHashtags)
    }

    func removePost(_ post: Post) {
        if let index = feedPosts.firstIndex(where: { $0.id == post.id }) {
            feedPosts.remove(at: index)
        }
    }

    func getPosts() -> [Post] {
        return feedPosts
    }

    func getHashtags() -> Set<String> {
        return hashtags
    }

    private func extractHashtags(from text: String) -> [String] {
        let hashtagPattern = "#\\w+"
        let regex = try! NSRegularExpression(pattern: hashtagPattern)
        let matches = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
        return matches.map { String(text[Range($0.range, in: text)!]) }
    }
}
