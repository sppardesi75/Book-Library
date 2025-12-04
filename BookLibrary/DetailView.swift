//
//  DetailView.swift
//  BookLibrary
//
//  Created by Sanskar Pardesi on 2025-02-28.
//

// DetailView.swift
import SwiftUI

struct DetailView: View {
    @Binding var book: Book
    @State private var secureText: String = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    // The password required for updates
    let requiredPassword = "admin123"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Display the book title and image
                Text(book.title)
                    .font(.largeTitle)
                    .bold()
                Image(book.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                
                // Display detailed description
                Text(book.description)
                    .font(.body)
                
                // Editable fields for title and description
                TextField("Edit Title", text: $book.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Edit Description", text: $book.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Secure input field for password entry
                SecureField("Enter Password", text: $secureText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Save button with real password validation and user feedback
                Button(action: {
                    if book.title.isEmpty || book.description.isEmpty || secureText.isEmpty {
                        alertTitle = "Error"
                        alertMessage = "All fields must be filled in."
                        showAlert = true
                    } else if secureText != requiredPassword {
                        alertTitle = "Error"
                        alertMessage = "Incorrect password. Please try again."
                        showAlert = true
                    } else {
                        // Successful update: changes are saved automatically via binding.
                        alertTitle = "Success"
                        alertMessage = "Book details updated securely!"
                        showAlert = true
                        // Optionally clear the secure field after a successful update.
                        secureText = ""
                    }
                }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle),
                          message: Text(alertMessage),
                          dismissButton: .default(Text("OK")))
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Book Details")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .constant(sampleBooks[0]))
    }
}
