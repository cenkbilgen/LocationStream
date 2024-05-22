//
//  File.swift
//  
//
//  Created by Cenk Bilgen on 2024-05-22.
//

import Foundation
import CoreLocation

fileprivate enum Places {
    static let toronto = CLLocationCoordinate2D(latitude: 43.65107, longitude: -79.347015)
}

enum Simulate {
    func locations(count: Int, center: CLLocationCoordinate2D = Places.toronto, spread: CLLocationDegrees = 0.3) -> AsyncStream<CLLocation> {

        let (stream, continuation) = AsyncStream<CLLocation>.makeStream()

        Task { [continuation] in
            for n in 0..<count {
                try await Task.sleep(for: .seconds(.random(in: 1..<10)))
                let latitude = CLLocationDegrees(center.latitude + CLLocationDegrees.random(in: 0..<spread))
                let longitude = CLLocationDegrees(center.longitude + CLLocationDegrees.random(in: 0..<spread))
                let location = CLLocation(latitude: latitude, longitude: longitude)
                continuation.yield(location)
            }
        }

        return stream
    }
}
