//
//  GroupViewController.swift
//  Money.io
//
//  Created by Matthew Chan on 2019-03-02.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {

    var group: Group!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        group = Group(name: "LHL")
       let user = User(name: "Matthew")
        
        group.addUser(user)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGroupMembersSegue" {
            if let viewController = segue.destination as? UINavigationController {
                if let groupMembersVC = viewController.children[0] as? GroupMembersViewController {
                    groupMembersVC.group = group
                }
            }
        }
    }

}