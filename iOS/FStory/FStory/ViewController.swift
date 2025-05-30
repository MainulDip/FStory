//
//  ViewController.swift
//  FStory
//
//  Created by Mainul Dip on 5/18/25.
//

import UIKit

class ViewController: UIViewController {
    
    var users: [User]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .orange
        self.users = fetchUserDataFromJSON(filename: "credentials")
        print(users ?? [])
        
    }


}

// testing email password from local json file
extension ViewController {
    func fetchUserDataFromJSON(filename fileName: String) -> [User]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([User].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}

