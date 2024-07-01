
import SwiftUI

struct SupportView: View {
    var body: some View {
        Form {
            Section(header: Text("Support")) {
                NavigationLink(destination: FAQView()) {
                    Text("FAQ")
                }
                NavigationLink(destination: ContactSupportView()) {
                    Text("Contact Support")
                }
            }
        }
        .navigationTitle("Support")
    }
}

#Preview {
    SupportView()
}
