//
//  ProfileViewController.swift
//  me
//
//  Created by Ganiya Nursalieva on 14.02.2025.
//
import UIKit
struct Gallery{
    let cover: UIImage
}

class ProfileViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    let photos: [Gallery] = [
        Gallery(cover: UIImage(named: "me1") ?? UIImage()),
        Gallery(cover: UIImage(named: "me2") ?? UIImage()),
        Gallery(cover: UIImage(named: "me3") ?? UIImage())
        //Gallery(cover: UIImage(named: "me4") ?? UIImage())
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! photoCell
        let photo = photos[indexPath.row]
        cell.configure(photo.cover)
        return cell
    }
}
