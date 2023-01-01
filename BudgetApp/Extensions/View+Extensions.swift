//
//  View+Extensions.swift
//  BudgetApp
//
//  Created by chirag arora on 01/01/23.
//

import Foundation
import SwiftUI

extension View {
    
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
