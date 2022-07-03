//
//  AllSettings.swift
//  My-Tesla
//
//  Created by Dalveer singh on 03/07/22.
//

import SwiftUI

struct SettingBlock:View{
    var icon:String
    var title:String
    var subtitle:String = ""
    var backGroundColor:Color = Color.white.opacity(0.05)
    var body:some View{
        HStack{
            Image(systemName: icon)
            VStack(alignment:.leading,spacing: 5){
                Text(title)
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: true, vertical: false)
                    .font(.system(size: 20, weight: .medium, design: .default))
                if subtitle.isEmpty == false{
                    Text(subtitle.uppercased())
                        .font(.system(size: 8, weight: .medium, design: .default))
                        .lineLimit(1)
                        .frame(maxWidth:.infinity,alignment:.leading )
                }
            }
            Spacer()
            Image(systemName: "chevron.right")

        }
        .padding()
        .background(backGroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.1),lineWidth: 0.5))
    }
}
struct AllSettings: View {
    var body: some View {
        VStack{
            CategoryHeader(title: "All Settings", showEdit: false)
            LazyVGrid(columns: [GridItem(.fixed(180)),GridItem(.fixed(180))],spacing: 10) {
                SettingBlock(icon: "car.fill", title: "Controls",subtitle: "Car Locked")
                SettingBlock(icon: "fanblades.fill", title: "Climate",subtitle: "Interior 68F",backGroundColor: Color.blue)
                SettingBlock(icon: "location.fill", title: "Location",subtitle: "New Delhi")
                SettingBlock(icon: "checkerboard.shield", title: "Security",subtitle: "0 events detected")
                SettingBlock(icon: "sparkles", title: "Upgrades",subtitle: "3 updates available")
            }
            
        }
    }
}

struct AllSettings_Previews: PreviewProvider {
    static var previews: some View {
        AllSettings()
    }
}
