//
//  AddBudgetScreen.swift
//  BudgetApp
//
//  Created by chirag arora on 01/01/23.
//

import SwiftUI

struct AddBudgetScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm: AddBudgetViewModel
    
    init(vm: AddBudgetViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        Form {
            TextField("Enter Title", text: $vm.name)
            TextField("Enter Total", text: $vm.total)
            
            Button("Save") {
                
                vm.save()
                presentationMode.wrappedValue.dismiss()
                
            }
            .centerHorizontally()
            
            .navigationTitle("Add New Budget")
        
        }
        
    }
}

struct AddBudgetScreen_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        NavigationView{
            
            
            
            AddBudgetScreen(vm: AddBudgetViewModel(context: viewContext))
        }
    }
}
