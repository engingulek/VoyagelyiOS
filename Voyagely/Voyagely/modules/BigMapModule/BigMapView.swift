//
//  BigMapView.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import SwiftUI
import MapKit
struct BigMapView: View {
    //TODO: Thil will be moved to other class
    let manager = CLLocationManager()
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
                ForEach(viewModel.allOnCity,id: \.id) { place in
                    Annotation("",coordinate: place.getAdCLLocationCoordinate2D()){
                        AnnotionView(place: place)
                    }
                }
            }
            
            VStack(alignment:.leading) {
                Button {
                    
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .padding()
                        .background(.white)
                        .clipShape(Circle())
                        .padding(.horizontal,25)
                        .padding(.vertical,35)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                }
            
                
                Spacer()
                ListOnMap(viewModel: viewModel)
                
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(height: 300)
                    .padding(.bottom,20)
                
            }
            
            
        } .navigationBarHidden(true)
            .ignoresSafeArea()
        
            .onAppear{
                viewModel.onAppear()
                manager.requestWhenInUseAuthorization()
            }.navigationDestination(isPresented: $viewModel.toDetailView) {
                router.toDetail()
            }
    }
}

#Preview {
    BigMapView(viewModel: BigMapViewModel(),router: BigMapRouter())
}
