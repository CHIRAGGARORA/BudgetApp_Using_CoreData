//
//  Budget+Extensions.swift
//  BudgetApp
//
//  Created by chirag arora on 01/01/23.
//

import Foundation
import CoreData

extension Budget: BaseModel {
    static var all: NSFetchRequest<Budget> {
        let request = Budget.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}
