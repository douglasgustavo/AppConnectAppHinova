//
//  MapaView.swift
//  AppConnect
//
//  Created by Douglas Santos on 02/11/21.
//

import SwiftUI
import MapKit

struct MapaView: View {
    var latitude: Double = -19.9664465
    var longitude: Double = -44.0276299
    @State var region = MKCoordinateRegion()
    @State var notacoes = [MapaAnnotation]()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: notacoes, annotationContent: { notacao in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: notacao.latitude, longitude: notacao.longitude)) {
                Image(systemName: "mappin")
                    .font(.title)
                    .foregroundColor(.principal)
            }
        })
            .onAppear {
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    )
                notacoes = [MapaAnnotation(latitude: self.latitude, longitude: self.longitude)]
            }
    }
}

struct MapaView_Previews: PreviewProvider {
    static var previews: some View {
        MapaView()
    }
}

struct MapaAnnotation: Identifiable, Decodable {
    var id = UUID()
    let latitude: Double
    let longitude: Double
    
    private enum CodingKeys: CodingKey {
        case latitude
        case longitude
    }
}
