

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {

   
    var contentLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.numberOfLines = 0
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        addSubview(contentLabel)
        if #available(iOS 9.0, *) {
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
            contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
            contentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
            contentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
            
        } else {
            // Fallback on earlier versions
        }
       
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 5.0
    }
}
