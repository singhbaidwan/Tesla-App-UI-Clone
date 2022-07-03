//
//  CategoryView.swift
//  My-Tesla
//
//  Created by Dalveer singh on 03/07/22.
//

import SwiftUI
struct CategoryView:View{
    var title:String
    var showEdit : Bool = false
    var actionItem:[ActionItem]
    var body:some View{
        VStack{
            CategoryHeader(title: title, showEdit: showEdit)
            ScrollView(.horizontal,showsIndicators: false)
            {
                HStack(alignment:.top){
                    ForEach(actionItem,id:\.self){
                        item in
                        ActionButton(actionItem: item)
                    }
                }
            }
        }
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(title: "", actionItem: recentActions)
    }
}
