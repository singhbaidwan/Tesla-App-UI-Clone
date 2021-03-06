//
//  CarSection.swift
//  My-Tesla
//
//  Created by Dalveer singh on 02/07/22.
//

import SwiftUI

struct CarSection: View {
    @Binding var openCharging:Bool
    var body: some View {
        VStack(spacing:10){
            HStack(alignment:.center){
                Button {
                    withAnimation {
                        openCharging = true
                    }
                } label: {
                    Label("250 Miles".uppercased(), systemImage: "battery.75")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("Green"))
                   
                }

                Spacer()
                VStack(alignment:.trailing)
                {
                    Text("Parked")
                        .fontWeight(.semibold)
                    Text("Last Updated : 10 min ago")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    
                }
            }
            Image("Car")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

//struct CarSection_Previews: PreviewProvider {
//    static var previews: some View {
//        CarSection()
//    }
//}
