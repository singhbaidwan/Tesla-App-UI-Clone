//
//  GeneralButton.swift
//  My-Tesla
//
//  Created by Dalveer singh on 02/07/22.
//

import SwiftUI

struct GeneralButton: View {
    var icon:String
    var body: some View {
        Image(systemName: icon)
            .imageScale(.large)
            .frame(width:44 , height: 44)
            .background(Color.white.opacity(0.05))
            .clipShape(Circle())
            .overlay {
                Circle().stroke(Color.white.opacity(0.1),lineWidth: 0.5)
            }
    }
}

struct GeneralButton_Previews: PreviewProvider {
    static var previews: some View {
        GeneralButton(icon: "gear").previewLayout(.sizeThatFits)
    }
}
