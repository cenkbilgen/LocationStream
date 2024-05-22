//
//  File.swift
//  
//
//  Created by Cenk Bilgen on 2024-05-22.
//

import Foundation
import CoreLocation

public actor LocationBroadcaster {
    private var latest: CLLocation?
    private var continuations: [CheckedContinuation<CLLocation, Error>] = []

    public func getLocation() async throws -> CLLocation {
        if let location = latest {
            location
        } else {
            try await withCheckedThrowingContinuation { continuation in
                continuations.append(continuation)
            }
        }
    }

    private func update(location: CLLocation) {
        latest = location
        for continuation in continuations {
            continuation.resume(returning: location)
        }
        continuations.removeAll()
    }

    // CoreLocation

    private let manager: CLLocationManager

    public init(setup: ((CLLocationManager) -> CLLocationManager) = { $0 }) {
        self.manager = setup(CLLocationManager())
        let delegate = Delegate(broadcaster: self)
        Task {
            self.manager.delegate = delegate
        }
    }

    class Delegate: NSObject, CLLocationManagerDelegate {
        let broadcaster: LocationBroadcaster
        init(broadcaster: LocationBroadcaster) {
            self.broadcaster = broadcaster
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else {
                return
            }
            Task {
                await broadcaster.update(location: location)
            }
        }
    }
}
