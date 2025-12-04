//
//  Book.swift
//  BookLibrary
//
//  Created by Sanskar Pardesi on 2025-02-28.
//


import Foundation

struct Book: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var imageName: String
}
