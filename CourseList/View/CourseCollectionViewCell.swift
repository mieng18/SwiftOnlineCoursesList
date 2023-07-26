//
//  CourseCollectionViewCell.swift
//  CourseList
//
//  Created by mai nguyen on 7/21/23.
//

import UIKit


class CourseCollectionViewCell: UICollectionViewCell {
    static let identifier = "CourseCollectionViewCell"
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        return imageView
        
    }()
    
    var tiltleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        return label
        
    }()
    
    var lessonLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        return label
        
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSubView() {
        
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)

        ])
       
        
        self.contentView.addSubview(tiltleLabel)
        tiltleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            tiltleLabel.heightAnchor.constraint(equalToConstant:20),
            tiltleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            tiltleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 10),
            tiltleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            tiltleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            tiltleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            tiltleLabel.leadingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)

        ])
       
    }
    
    func updateCell(course: Course) {
        
        if  course.imageURL != nil, course.name != nil {
            imageView.loadImage(url: course.imageURL)
            tiltleLabel.text = course.name
            
        }
    }
}


extension UIImageView {
    func loadImage(url: String) {
        guard let urlString = URL(string: url) else {return}
        
        let session = URLSession.shared.dataTask(with: urlString) {(data, response,error) in
            
            if let data = data, error == nil {
                let image  = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
            .resume()
        
    }
}
