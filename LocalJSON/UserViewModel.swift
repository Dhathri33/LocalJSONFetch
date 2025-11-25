//
//  UserViewModel.swift
//  LocalJSON
//
//  Created by Dhathri Bathini on 11/25/25.
//

class UserViewModel{
    var shared: FileManager
    var userDetails: [UserDetails] = []
    
    init(shared: FileManager) {
        self.shared = shared
    }
    
    func getCount() -> Int {
        userDetails.count
    }
    
    func getUser(index: Int) -> UserDetails {
        return userDetails[index]
    }
    
    func getData() {
        userDetails = shared.getDataFromLocalFile()
    }
}
