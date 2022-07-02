//
//  ContentView.swift
//  My-Tesla
//
//  Created by Dalveer singh on 02/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack
        {
            ScrollView{
                VStack(spacing:20) {
                    HomeHeaderView()
                        .padding(.top)
                    CustomDivider()
                    CarSection()
                    CustomDivider()
                    CategoryView(title: "Quick ShortCuts",showEdit: true)
                    CustomDivider()
                    CategoryView(title: "Recent Actions",showEdit: false)
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

struct CategoryView:View{
    var title:String
    var showEdit : Bool
    var body:some View{
        VStack{
            CategoryHeader(title: title, showEdit: showEdit)
            ScrollView(.horizontal,showsIndicators: false)
            {
                HStack{
                    
                }
            }
        }
        
    }
}
