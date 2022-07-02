//
//  VoiceCommandButtonView.swift
//  My-Tesla
//
//  Created by Dalveer singh on 02/07/22.
//

import SwiftUI

struct VoiceCommandButtonView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Image(systemName: "mic.fill")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .frame(width:64,height:64)
                    .background(Color("Green"))
                    .foregroundColor(Color("DarkGray"))
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 10)
            }
        }
        .ignoresSafeArea()
    }
}

struct VoiceCommandButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceCommandButtonView()
    }
}
