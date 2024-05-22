import CoreLocation

//public struct LocationState {
//    let manager = CLLocationManager()
//    public let locationStream: AsyncStream<CLLocation>
//    public let authorizationStream: AsyncStream<(CLAuthorizationStatus, CLAccuracyAuthorization)>
//
//    init() {
//        let (stream, continuation) = AsyncStream.makeStream(of: CLLocation.self, bufferingPolicy: .bufferingNewest(1))
//        self.locationStream = stream
//        self.delegate = LocationStateDelegate(state: nil, continuation: continuation)
//        manager.delegate = self.delegate
//        delegate.state = self
//        manager.requestWhenInUseAuthorization()
//        manager.activityType = .fitness
//        manager.desiredAccuracy = CLLocationAccuracy(0.2)
//        manager.pausesLocationUpdatesAutomatically = false
//        manager.distanceFilter = CLLocationDistance(0.2)
//        manager.startUpdatingHeading()
//        manager.startUpdatingLocation()
//
//        Task {
//            async let location = await self.locationStream.first { location in
//                location.horizontalAccuracy < 1000 && location.verticalAccuracy < 1000
//            }!
//            City.toronto.isInside(coordinate: location?.coordinate)
//        }
//    }
//}
//
