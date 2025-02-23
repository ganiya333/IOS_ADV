import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    private let feedSystem = FeedSystem()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadPosts()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func loadPosts() {
        let post1 = Post(id: UUID(), authorId: UUID(), userName: "Ordiyeva Amira", content: " Today, we're sharing tips to make your dog's life even more comfortable. From cozy sleeping spots to healthy treats — everything your pup needs to stay happy", likes: 10, imageName: "image1")
        let post2 = Post(id: UUID(), authorId: UUID(), userName: "Baigaliyeva Kamila", content: "Dogs aren’t just pets, they’re family. 🐕✨ Today, we’re sharing a heartwarming story about how one dog changed their owners’ lives forever.е", likes: 20, imageName: "image2")
        let post3 = Post(id: UUID(), authorId: UUID(), userName: "Jeon Jungkook", content: "Pawsitive vibes only! � Whether it’s playtime, nap time, or snack time, every moment with your dog is special.", likes: 15, imageName: "image3")

        feedSystem.addPost(post1)
        feedSystem.addPost(post2)
        feedSystem.addPost(post3)

        tableView.reloadData()
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedSystem.getPosts().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let post = feedSystem.getPosts()[indexPath.row]
        cell.configure(userName: post.userName, content: post.content, likes: post.likes, imageName: post.imageName)
        return cell
    }

   
}
