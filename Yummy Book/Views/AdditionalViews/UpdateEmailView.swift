import SwiftUI

struct UpdateEmailView: View {
    @Binding var email: String
    
    var body: some View {
        Form {
            Section(header: Text("Update Email")) {
                TextField("New Email", text: $email)
                    .keyboardType(.emailAddress)
                Button(action: {
                    // Update email logic
                }) {
                    Text("Save")
                }
            }
        }
        .navigationTitle("Update Email")
    }
}

#Preview {
    UpdateEmailView(email: .constant("vmaksymovk@gmail.com"))
}
