//
//  ContentView.swift
//  My-Tesla
//
//  Created by Dalveer singh on 02/07/22.
//

import SwiftUI

let quickShortcut:[ActionItem] = [ActionItem(icon: "bolt.fill", text: "Charging"),ActionItem(icon: "fanblades.fill", text:  "Fan On"),ActionItem(icon: "music.note", text: "Media Controls"),ActionItem(icon: "bolt.car", text: "Close Charging Port")]

let recentActions:[ActionItem] = [ActionItem(icon: "arrow.up.square", text: "Open Trunk"),ActionItem(icon: "fanblades", text:  "Fan Off"),ActionItem(icon: "person.fill.viewfinder", text: "Summon")]

struct ContentView: View {
    var body: some View {
        NavigationView{
        ZStack
        {
            ScrollView{
                VStack(spacing:20) {
                    HomeHeaderView()
                        .padding(.top)
                    CustomDivider()
                    CarSection()
                    CustomDivider()
                    CategoryView(title: "Quick ShortCuts",showEdit: true, actionItem: quickShortcut)
                    CustomDivider()
                    CategoryView(title: "Recent Actions",showEdit: false,actionItem: recentActions)
                    CustomDivider()
                    AllSettings()
                    ReorderButton()
                }
                .padding()
            }
            
            VoiceCommandButtonView()
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color("DarkGray"))
        .foregroundColor(.white)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CustomDivider:View{
    var body: some View{
        Rectangle()
            .frame(maxWidth:.infinity)
            .frame(height:0.25)
            .background(Color.white)
            .opacity(0.1)
    }
}
struct CategoryHeader:View{
    var title:String
    var showEdit : Bool
    
    var body:some View{
        HStack(alignment:.center){
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Spacer()
            if showEdit{
                
                Button(action: {}) {
                    
                    Text("Edit")
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                    
                }
            }
            
        }
    }
}
struct ReorderButton:View{
    var body: some View{
        Button {
            
        } label: {
                Text("Reorder Groups")
                    .font(.caption)
                    .padding(.vertical,8)
                    .padding(.horizontal,14)
                    .background(Color.white.opacity(0.05))
                    .clipShape(Capsule())
        }

    }
}
