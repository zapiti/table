

import UIKit

class CollectionViewController: UIViewController {

    let contentCellIdentifier = "ContentCellIdentifier"

    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: CustomCollectionViewLayout())
        //If you set it false, you have to add constraints.
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        if #available(iOS 9.0, *) {
            collectionView.leftAnchor.constraint(equalTo:   view.leftAnchor, constant: 10).isActive = true
            collectionView.rightAnchor.constraint(equalTo:   view.rightAnchor, constant: -10).isActive = true
            collectionView.topAnchor.constraint(equalTo:   view.topAnchor, constant: 100).isActive = true
          collectionView.heightAnchor.constraint(equalToConstant: 600).isActive = true
            
        
        } else {
            // Fallback on earlier versions
        }
     
        collectionView.register(ContentCollectionViewCell.self,
                                forCellWithReuseIdentifier: contentCellIdentifier)
    }

}

// MARK: - UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // swiftlint:disable force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellIdentifier,
                                                      for: indexPath) as! ContentCollectionViewCell

        if indexPath.section % 2 != 0 {
            cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.white
        }

        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.contentLabel.text = "Date"
            } else {
                cell.contentLabel.text = "Section"
            }
        } else {
            if indexPath.row == 0 {
                cell.contentLabel.text = String(indexPath.section)
            } else {
                cell.contentLabel.text = "Content"
            }
        }

        return cell
    }

}

// MARK: - UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDelegate {

}
