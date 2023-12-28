//
//  Locations.swift
//  BucketList
//
//  Created by Sudhir Kesharwani on 28/12/23.
//

import Foundation
import MapKit

struct Locations: Identifiable {
    var id = UUID()
    var locName: String
    var coordinates: CLLocationCoordinate2D
    
}
