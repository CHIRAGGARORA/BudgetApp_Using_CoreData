//
//  BudgetAppApp.swift
//  BudgetApp
//
//  Created by chirag arora on 01/01/23.
//

import SwiftUI

@main
struct BudgetAppApp: App {
    var body: some Scene {
        WindowGroup {
            
            
            
            let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
            ContentView(vm: BudgetListViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
