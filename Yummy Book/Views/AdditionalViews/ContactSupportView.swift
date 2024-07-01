

import SwiftUI

struct ContactSupportView: View {
    @State private var message: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Contact Support")) {
                TextEditor(text: $message)
                    .frame(height: 200)
                Button(action: {
                    // Send support message logic
                }) {
                    Text("Send")
                }
            }
        }
        .navigationTitle("Contact Support")
    }
}

#Preview {
    ContactSupportView()
}
