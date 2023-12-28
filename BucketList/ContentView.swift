//
//  ContentView.swift
//  BucketList
//
//  Created by Sudhir Kesharwani on 27/12/23.
//

import SwiftUI
import MapKit

struct Users: Comparable,Identifiable{
    var id = UUID()
    var firstName: String
    var lastName: String
    
    static func <(lhs: Users, rhs: Users) -> Bool{
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    
    let locations = [
        Locations(locName: "Shaniwar Wada", coordinates: CLLocationCoordinate2D(latitude: 18.5194647, longitude: 73.8527426)),

        Locations(locName: "Okoyama Garden", coordinates: CLLocationCoordinate2D(latitude: 18.5296378, longitude: 73.8388334))
    ]
    
    var body: some View {
        VStack {
            Map(){
                ForEach(locations) { location in
                    Annotation(location.locName, coordinate: location.coordinates){
                        Text(location.locName)
                            .font(.headline)
                            .padding()
                            .background(.blue.gradient)
                            .clipShape(.capsule)
                    }.annotationTitles(.hidden)
                }
            }
                .cornerRadius(10)
            List(locations){ location in
                Text("\(location.locName)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
