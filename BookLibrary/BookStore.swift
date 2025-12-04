//
//  BookStore.swift
//  BookLibrary
//
//  Created by Sanskar Pardesi on 2025-02-28.
//

import Foundation
import Combine

class BookStore: ObservableObject {
    @Published var books: [Book] = sampleBooks
}
