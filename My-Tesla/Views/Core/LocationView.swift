//
//  LocationView.swift
//  My-Tesla
//
//  Created by Dalveer singh on 04/07/22.
//

import SwiftUI
import MapKit
struct CarLocation:Identifiable{
    let id = UUID()
    let latitude:Double
    let longitude:Double
    var coordinate:CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
let carLocations = [CarLocation(latitude: 40.7484, longitude:  -73.9857)]
struct LocationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.9857), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    var body: some View {
        ZStack
        {
            Map(coordinateRegion: $location,annotationItems: carLocations) { location in
                MapAnnotation(coordinate: location.coordinate, content: {CarPin()})
            }
            CarLocationPanel()
            LinearGradient(gradient: Gradient(colors: [Color("DarkGray"),Color.clear,Color.clear]), startPoint: .top, endPoint: .bottom)
                .allowsHitTesting(false)
            VStack{
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        GeneralButton(icon: "chevron.left")
                    }
                    Spacer()
                    Button(action: {}) {
                        GeneralButton(icon: "speaker.wave.3.fill")
                    }
                }
                .padding()
                Spacer()
            }
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color("DarkGray"))
        .foregroundColor(.white)
        .navigationBarHidden(true)
    }
    
}
struct CarPin:View{
    var body: some View{
        VStack(alignment:.center,spacing: 4){
            Image(systemName: "car.fill")
                .frame(width:36, height: 36,alignment: .center)
                .background(Color("Red"))
                .foregroundColor(Color.white)
                .clipShape(Circle())
            Text("New York")
                .font(.footnote)
                .fontWeight(.medium)
                .padding(.horizontal,8)
                .padding(.vertical,4)
                .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 8,style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color.black.opacity(0.1),lineWidth: 1))
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

struct CarLocationPanel: View {
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment:.leading,spacing: 20){
                VStack(alignment:.leading,spacing: 10){
                    Text("Location")
                        .font(.title)
                        .fontWeight(.semibold)
                    CustomDivider()
                    Label("20 W 34th St,New York ", systemImage: "location.fill")
                        .opacity(0.5)
                        .font(.subheadline)
                }
                VStack(alignment:.leading,spacing: 10){
                    Text("Summon")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity,alignment: .leading)
                    Text("Press and Hold control to move Vehicle")
                        .opacity(0.5)
                        .font(.footnote)
                    CustomDivider()
                   FullButton(text: "Go to Target")
                    HStack{
                        FullButton(icon:"arrow.up", text: "Forwar")
                        FullButton(icon:"arrow.down",text: "Backward")
                    }
                }
                
            }
            .padding()
            .frame(maxWidth:.infinity)
            .background(Color("DarkGray"))
            .foregroundColor(Color.white)
        }
    }
}
