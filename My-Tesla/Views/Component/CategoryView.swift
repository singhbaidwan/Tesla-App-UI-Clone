//
//  CategoryView.swift
//  My-Tesla
//
//  Created by Dalveer singh on 03/07/22.
//

import SwiftUI

let quickShortcut:[ActionItem] = [ActionItem(icon: "music.note", text: "Media Controls"),ActionItem(icon: "bolt.car", text: "Close Charging Port")]

let recentActions:[ActionItem] = [ActionItem(icon: "arrow.up.square", text: "Open Trunk"),ActionItem(icon: "fanblades", text:  "Fan Off"),ActionItem(icon: "person.fill.viewfinder", text: "Summon")]
let chargingShortcu = ActionItem(icon: "bolt.fill", text: "Charging")
let mediaShortcut = ActionItem(icon: "fanblades.fill", text:  "Fan On")
struct CategoryView:View{
    
    @Binding var openAction : Bool
    @Binding var actionText:String
    @Binding var actionIcon:String
    @Binding var openCharging:Bool
    @Binding var openMedia:Bool
    
    var title:String
    var showEdit : Bool = false
    var actionItem:[ActionItem]
    var body:some View{
        VStack{
            CategoryHeader(title: title, showEdit: showEdit)
            ScrollView(.horizontal,showsIndicators: false)
            {
                HStack(alignment:.top){
                    if title == "Quick ShortCuts" {
                        Button(action: {
                            withAnimation {
                                openCharging = true
                            }
                        }) {
                            ActionButton(actionItem: chargingShortcu)
                            
                        }
                        Button(action: {
                            withAnimation {
                                openMedia = true
                            }
                        }) {
                            ActionButton(actionItem: mediaShortcut)
                        }
                        
                    }
                    ForEach(actionItem,id:\.self){
                        item in
                        Button {
                            withAnimation {
                                openAction = true
                                actionText = item.text
                                actionIcon = item.icon
                            }
                        } label: {
                            
                            ActionButton(actionItem: item)
                        }

                    }
                }
            }
        }
        
    }
}
//
//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView(title: "", actionItem: recentActions)
//    }
//}
