//
//  StepCardView.swift
//  Yummy Book
//
//  Created by Влад on 7/17/24.
//

import SwiftUI

struct StepCardView: View {
    let stepNumber: Int
    let stepText: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Step \(stepNumber)")
                .font(.headline)
                .padding(.bottom, 5)
            Text(stepText)
                .font(.body)
                
        }
        .padding()
    }
}

#Preview {
    StepCardView(stepNumber: 1, stepText: "")
}
