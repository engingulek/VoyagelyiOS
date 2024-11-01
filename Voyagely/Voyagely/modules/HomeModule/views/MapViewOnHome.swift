//
//  MapViewOnHome.swift
//  Voyagely
//
//  Created by Engin Gülek on 31.10.2024.
//

import SwiftUI
import MapKit



struct MapViewOnHome: View {
    @ObservedObject var viewModel:HomeViewModel
    private var router : HomeViewRouterProtocol
    
    init(viewModel: HomeViewModel, router: HomeViewRouterProtocol) {
        self.viewModel = viewModel
        self.router = router
        
    }
    //TODO: Thil will be moved to other class
    let manager = CLLocationManager()
    @State private var cameraPostion : MapCameraPosition = .userLocation(fallback: .automatic)
    var body: some View {
        
        VStack {
            Text("Near By")
            Map(position: $cameraPostion)
            {
                UserAnnotation()
                ForEach(viewModel.nearByPlaces,id: \.id) { place in
                    Annotation("", coordinate: place.getAdCLLocationCoordinate2D())
                    {
                        AnnotionView(place: place)
                            .onTapGesture {
                                viewModel.onTapGestureLocation(id: place.id)
                            }
                    }
                }
            }
            .onAppear{
                manager.requestWhenInUseAuthorization()
            }
        }.navigationDestination(isPresented: $viewModel.toDetailView) {
            router.toDetailView(id:viewModel.selectedId )
        } 
    }
}

#Preview {
    MapViewOnHome(viewModel: HomeViewModel(service: HomeService()),router: HomeViewRouter())
}


