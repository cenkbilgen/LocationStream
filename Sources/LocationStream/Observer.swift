//
//  File.swift
//  
//
//  Created by Cenk Bilgen on 2024-05-22.
//

import CoreLocation
import Observation

@available(macOS 14.0, *)
@Observable
public final class LocationObserver: NSObject, CLLocationManagerDelegate {
    public var location: CLLocation?

    private let manager: CLLocationManager

    public init(setup: ((CLLocationManager) -> CLLocationManager) = { $0 }) {
        self.manager = setup(CLLocationManager())
        super.init()
        self.manager.delegate = self
    }

    // MARK: Delegate

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.last
    }
}
