//
//  BigMapView.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import SwiftUI
import MapKit
struct BigMapView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel:BigMapViewModel
    @State private var cameraPostion : MapCameraPosition = .userLocation(fallback: .automatic)
    private var router : BigMapRouterProtocol
    init(viewModel: BigMapViewModel, router: BigMapRouterProtocol) {
        self.viewModel = viewModel
        self.router = router
    }
    var body: some View {
        
        ZStack{
            Map(position: $cameraPostion){
                UserAnnotation()
                ForEach(viewModel.nearByCities,id: \.id) { place in
                    Annotation("",coordinate: CLLocationCoordinate2D(latitude: place.latitude,
                                                                     longitude: place.longitude)){
                        AnnotionView(place: place)
                    }
                }
            }
            
            VStack(alignment:.leading) {
               BackButton()
                    .padding(.vertical,15)
                Spacer()
                ListOnMap(viewModel: viewModel)
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(height: 300)
                    .padding(.bottom,20)
            }
        } .navigationBarHidden(true)
            .ignoresSafeArea()
        
            .task{
               await viewModel.task()
                
            }.navigationDestination(isPresented: $viewModel.toDetailView) {
                router.toDetail()
            }
    }
}

#Preview {
    BigMapView(viewModel: BigMapViewModel(),router: BigMapRouter())
}
