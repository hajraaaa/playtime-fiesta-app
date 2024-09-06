import Foundation
import UIKit

class PageCell: UICollectionViewCell{
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupLayout()
    }
    
    // Page model that will be used to configure the cell
    var page: Page?{
        didSet{
            guard let unwrappedPage = page else { return }
            
            // Set the image of the bearImageView using the image name from the page model
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray ]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
// UIImageView to display an image
   private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    // UITextView to display text with attributed styling
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        //The attributedText is set in the didSet observer of the 'page' property
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    // Function to setup layout constraints for subviews
    private func setupLayout(){
        let topImageContainerView = UIView()

        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        topImageContainerView.trailingAnchor.constraint(equalTo:  trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(bearImageView )
        
        bearImageView.centerXAnchor.constraint(equalTo:topImageContainerView.centerXAnchor).isActive = true
        
        bearImageView.centerYAnchor.constraint(equalTo:topImageContainerView.centerYAnchor).isActive = true
                
        bearImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
         
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
