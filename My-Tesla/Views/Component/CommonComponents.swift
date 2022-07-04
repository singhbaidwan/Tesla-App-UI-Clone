//
//  CommonComponents.swift
//  My-Tesla
//
//  Created by Dalveer singh on 04/07/22.
//

import SwiftUI

import Foundation

struct FullButton:View{
    var icon:String = ""
    var text:String
    var body: some View{
        if icon.isEmpty {
            textButton
        }
        else
        {
            iconButton
        }
    }
    var iconButton:some View{
            Label(text, systemImage: icon)
                .font(.system(size: 14, weight: .medium, design: .default))
                .frame(maxWidth:.infinity)
                .padding()
                .background(Color.white.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .overlay(RoundedRectangle(cornerRadius: 14,style: .continuous).stroke(Color.white.opacity(0.1),lineWidth: 0.5))
        
    }
    var textButton:some View{
        Text(text)
            .font(.system(size: 14, weight: .medium, design: .default))
            .frame(maxWidth:.infinity)
            .padding()
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .overlay(RoundedRectangle(cornerRadius: 14,style: .continuous).stroke(Color.white.opacity(0.1),lineWidth: 0.5))
    }
}

