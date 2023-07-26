//
//  CourseViewModel.swift
//  CourseList
//
//  Created by mai nguyen on 7/21/23.
//

import Foundation


class CourseViewModel {
    
    var courses: [Course] = []
    
    func fetchData(completion: @escaping ([Course]) -> Void) {
        NetWorkManager.shared.getData { courses in
            self.courses = courses
            completion(courses)
        }
    }
    
    func numberOfcourse() -> Int {
        return courses.count 
    }
    
}
