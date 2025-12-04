//
//  MasterView.swift
//  BookLibrary
//
//  Created by Sanskar Pardesi on 2025-02-28.
//


import SwiftUI

struct MasterView: View {
    @ObservedObject var bookStore: BookStore

    var body: some View {
        NavigationView {
            List {
                // Use a binding so changes in DetailView update the shared data model
                ForEach($bookStore.books) { $book in
                    NavigationLink(destination: DetailView(book: $book)) {
                        HStack {
                            Image(book.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            Text(book.title)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("Book Library")
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(bookStore: BookStore())
    }
}
