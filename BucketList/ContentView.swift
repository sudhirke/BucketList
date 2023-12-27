//
//  ContentView.swift
//  BucketList
//
//  Created by Sudhir Kesharwani on 27/12/23.
//

import SwiftUI

struct Users: Comparable,Identifiable{
    var id = UUID()
    var firstName: String
    var lastName: String
    
    static func <(lhs: Users, rhs: Users) -> Bool{
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    
    let users = [
    
        Users(firstName: "Abhishek", lastName: "Banerjee"),
        Users(firstName: "Sudhir", lastName: "Kesharwani"),
        Users(firstName: "Khozema", lastName: "Rangwala"),
        Users(firstName: "Huzefa", lastName: "Andmanwala"),
    ].sorted()
    
    var body: some View {
        VStack {
            List(users){ user in
                Text("\(user.lastName), \(user.firstName)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
