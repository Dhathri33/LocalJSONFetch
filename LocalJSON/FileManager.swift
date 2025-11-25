//
//  FileManager.swift
//  LocalJSON
//
//  Created by Dhathri Bathini on 11/25/25.
//
import Foundation

class FileManager {
    static let shared = FileManager()
    private init() {}
    
    func getDataFromLocalFile() -> [UserDetails] {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("Invalid JSON file")
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode([UserDetails].self, from: data)
        }
        catch {
            print("Error getting/parsing data")
            return []
        }
    }
}
