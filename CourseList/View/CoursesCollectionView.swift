//
//  CoursesCollectionView.swift
//  CourseList
//
//  Created by mai nguyen on 7/21/23.
//

import Foundation
import UIKit


class CoursesCollectionView: UIViewController {

    let width: CGFloat =  UIScreen.main.bounds.width
    let height: CGFloat =  UIScreen.main.bounds.height

    let viewModel = CourseViewModel()
    

    
    var collectionView: UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Course List"
        setCollectionView()
       
        collectionView?.register(CourseCollectionViewCell.self, forCellWithReuseIdentifier: CourseCollectionViewCell.identifier)

        self.view.addSubview(collectionView ?? UICollectionView())
        
        viewModel.fetchData { data in
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightGray
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    

    func setCollectionView() {
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: setLayout())
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    func setLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: 200)
        layout.minimumLineSpacing = 20
        return layout
    }
    
    
}


extension CoursesCollectionView: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfcourse()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCollectionViewCell.identifier, for: indexPath) as? CourseCollectionViewCell{
            let data = viewModel.courses[indexPath.row]
            cell.updateCell(course: data)
            return cell
        }
        
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = viewModel.courses[indexPath.row]
        let detailVC = DetailCourseViewController()
        
        detailVC.updateCell(course: data)
        self.navigationController?.pushViewController(detailVC, animated: true)

        
    }
}
