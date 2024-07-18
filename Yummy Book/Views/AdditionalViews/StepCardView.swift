
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
                .fixedSize(horizontal: false, vertical: true)
                
        }
        .padding()
        .frame(minHeight: 160)
    }
}

#Preview {
    StepCardView(stepNumber: 1, stepText: "")
}
