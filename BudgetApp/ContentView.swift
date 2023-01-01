//
//  ContentView.swift
//  BudgetApp
//
//  Created by chirag arora on 01/01/23.
//

import SwiftUI

struct ContentView: View {
   
    @State private var isPresented: Bool = false
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var BudgetListVM: BudgetListViewModel
    
    init(vm: BudgetListViewModel) {
        self.BudgetListVM = vm
    }
    
    private func deleteBudget(at offsets: IndexSet) {
        offsets.forEach { index in
            let budget = BudgetListVM.budgets[index]
            BudgetListVM.deleteBudget(budgetId: budget.id)
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            
            VStack {
                List {
                    ForEach(BudgetListVM.budgets) { budget in
                        Text(budget.title)
                        
                    }.onDelete(perform: deleteBudget)
                }
            }
            .sheet(isPresented: $isPresented,onDismiss: {
                //empty
            }, content: {
                AddBudgetScreen(vm: AddBudgetViewModel(context: viewContext))
            })
            
            .navigationTitle("Budgets")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add new Budget") {
                        isPresented = true
                    }
                }
            }
            
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
            ContentView(vm: BudgetListViewModel(context: viewContext))
            
        }
    }
}
