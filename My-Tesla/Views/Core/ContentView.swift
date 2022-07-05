//
//  ContentView.swift
//  My-Tesla
//
//  Created by Dalveer singh on 02/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var openVoiceCommand = false
    @State private var openMediaControls = false
    @State private var openCharging = false
    
    @State private var actionText = ""
    @State private var actionIcon = ""
    @State private var openAction = false
    var body: some View {
        NavigationView{
        ZStack
        {
            ScrollView{
                VStack(spacing:20) {
                    HomeHeaderView()
                        .padding(.top)
                    CustomDivider()
                    CarSection(openCharging: $openCharging)
                    CustomDivider()
                    CategoryView(openAction: $openAction, actionText: $actionText, actionIcon: $actionIcon, openCharging: $openCharging, openMedia: $openMediaControls,title: "Quick ShortCuts",showEdit: true, actionItem: quickShortcut)
                    CustomDivider()
                    CategoryView(openAction: $openAction, actionText: $actionText, actionIcon: $actionIcon, openCharging: $openCharging, openMedia: $openMediaControls,title: "Recent Actions",showEdit: false,actionItem: recentActions)
                    CustomDivider()
                    AllSettings()
                    ReorderButton()
                }
                .padding()
            }
            if (openVoiceCommand || openCharging || openMediaControls || openAction){
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                    .onTapGesture {
                        withAnimation {
                            openCharging = false
                            openVoiceCommand = false
                            openMediaControls = false
                            openAction = false 
                        }
                    }
            }
            VoiceCommandButtonView(open: $openVoiceCommand)
            if openVoiceCommand{
                VoiceCommandView(open: $openVoiceCommand, text: "Take me to New Delhi")
                    .zIndex(1)
                    .transition(.move(edge: .bottom))
            }
            if openCharging{
                ChargingView().zIndex(1)
                    .transition(.move(edge: .bottom))
                
            }
            if openMediaControls{
                MediaPlayer()
                    .zIndex(1)
                    .transition(.move(edge: .bottom))
            }
            if openAction && !actionText.isEmpty {
                ActionNofication(open: $openAction, icon: actionIcon, text: actionText)
                    .zIndex(1)
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color("DarkGray"))
        .foregroundColor(.white)
        .navigationBarHidden(true)
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
