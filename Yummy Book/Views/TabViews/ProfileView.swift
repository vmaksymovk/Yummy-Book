import SwiftUI

struct ProfileView: View {
    @State private var username: String = "Vladyslav Maksymov"
    @State private var email: String = "vmaksymovk@gmail.com"
    @Environment(\.isDarkMode) private var isDarkMode
    var body: some View {
        NavigationView {
                Form {
                    Section(header: Text("Profile")) {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                            VStack(alignment: .leading) {
                                Text(username)
                                    .font(.headline)
                                Text(email)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    Section(header: Text("Account Settings")) {
                        NavigationLink(destination: ChangePasswordView()) {
                            Text("Change Password")
                        }
                        NavigationLink(destination: UpdateEmailView(email: $email)) {
                            Text("Update Email")
                        }
                        Button(action: {
                            // Sign out logic
                        }) {
                            Text("Sign Out")
                                .foregroundColor(.red)
                        }
                    }
                    
                    Section(header: Text("Preferences")) {
                                        Toggle(isOn: Binding(
                                            get: { isDarkMode },
                                            set: { newValue in
                                                UserDefaults.standard.set(newValue, forKey: "isDarkMode")
                                            }
                                        )) {
                                            Text("Dark Mode")
                                        }
                                    }
                    
                    Section(header: Text("Support")) {
                        NavigationLink(destination: SupportView()) {
                            Text("Help & Feedback")
                        }
                    }
                    
                }
                .navigationTitle("Profile")
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(FavoritesManager())
        
}
