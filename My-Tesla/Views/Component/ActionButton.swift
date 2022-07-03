//
//  ActionButton.swift
//  My-Tesla
//
//  Created by Dalveer singh on 03/07/22.
//

import SwiftUI

struct ActionButton:View{
    var actionItem:ActionItem
    var body: some View{
        VStack(alignment:.center){
            GeneralButton(icon: actionItem.icon)
            Text(actionItem.text)
                .frame(width:72)
                .font(.system(size: 12, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
        }
    }
}
            
struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(actionItem: ActionItem(icon: "", text: ""))
    }
}
