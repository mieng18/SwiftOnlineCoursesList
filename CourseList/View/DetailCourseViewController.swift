//
//  DetailCourseViewController.swift
//  CourseList
//
//  Created by mai nguyen on 7/21/23.
//

import UIKit


class DetailCourseViewController: UIViewController {


    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "sample-pic")
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
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.text = "123"
        return label
        
    }()
    
    var lessonLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubView()
    }
    
    func addSubView() {
        
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 30),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)

        ])
       
        
        self.view.addSubview(tiltleLabel)
        tiltleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            tiltleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 20),
            tiltleLabel.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 20),
            tiltleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)

        ])
        
        self.view.addSubview(lessonLabel)
        lessonLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            lessonLabel.topAnchor.constraint(equalTo: tiltleLabel.bottomAnchor),
            lessonLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            lessonLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            lessonLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)

        ])
       
    }
    
    func updateCell(course: Course) {
        
        if  course.imageURL != nil, course.name != nil {
            imageView.loadImage(url: course.imageURL)
            tiltleLabel.text = course.name
            lessonLabel.text = "Lectures:" +  String(course.numberOfLessons)
            
        }
    }
    
}
