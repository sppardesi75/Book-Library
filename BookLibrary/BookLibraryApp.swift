//
//  BookLibraryApp.swift
//  BookLibrary
//
//  Created by Sanskar Pardesi on 2025-02-28.
//


import SwiftUI

@main
struct BookLibraryApp: App {
    @StateObject var bookStore = BookStore()

    var body: some Scene {
        WindowGroup {
            MasterView(bookStore: bookStore)
        }
    }
}

