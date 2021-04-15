//
//  Session.swift
//  CognizantDemo
//
//  Created by Jalp on 15/04/2021.
//

import SwiftUI

/*
 Session class that is of type ObservableObject
 ObservableObject is an object with a publisher that emits when a value changes
 */
class Session: ObservableObject {
    // A publisher of type bool
    @Published var authenticated: Bool = false
}
