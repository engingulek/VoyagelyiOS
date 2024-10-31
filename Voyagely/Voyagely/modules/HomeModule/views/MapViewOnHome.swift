//
//  MapViewOnHome.swift
//  Voyagely
//
//  Created by Engin Gülek on 31.10.2024.
//

import SwiftUI
import MapKit

struct Locationn: Identifiable {
    let id = UUID() // Her konuma benzersiz bir kimlik verin
    let name: String
    let coordinate: CLLocationCoordinate2D
}

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784)
    static let startingLocation2 = CLLocationCoordinate2D(latitude: 37.3329, longitude:-122.0054)
    
}

struct MapViewOnHome: View {
    let manager = CLLocationManager()
    @State private var cameraPostion : MapCameraPosition = .userLocation(fallback: .automatic)
    var body: some View {
        
        Map(position: $cameraPostion){
            UserAnnotation()
            Annotation("Test", coordinate: MapDetails.startingLocation2)
            {
                VStack{
                    Circle().background(Color.red).frame(width: 20,height: 20)
                }
            }
            
        }.mapControls {
            MapUserLocationButton()
        }
        .onAppear{
            manager.requestWhenInUseAuthorization()
        }
        
    }
}

#Preview {
    MapViewOnHome()
}



class TestViewModel:ObservableObject {
    @Published  var region = MapCameraPosition.region(MKCoordinateRegion(center: MapDetails.startingLocation, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
}
