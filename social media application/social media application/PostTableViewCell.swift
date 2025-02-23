import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var likesLabel: UILabel!
    @IBOutlet private weak var postImageView: UIImageView!

    func configure(userName: String, content: String, likes: Int, imageName: String?) {
            userNameLabel.text = userName
            contentLabel.text = content
            likesLabel.text = "Likes: \(likes)"
           
            postImageView.image = nil

            if let imageName = imageName {
                DispatchQueue.global().async { [weak self] in
                  
                    Thread.sleep(forTimeInterval: 1)
           
                    let image = UIImage(named: imageName)
                    
                    DispatchQueue.main.async {
                        self?.postImageView.image = image
                    }
                }
            }
        }

        override func prepareForReuse() {
            super.prepareForReuse()
            postImageView.image = nil 
        }
    }
