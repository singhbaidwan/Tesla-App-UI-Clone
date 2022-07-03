//
//  CarControlView.swift
//  My-Tesla
//
//  Created by Dalveer singh on 03/07/22.
//

import SwiftUI
let carControl:[ActionItem] = [
    ActionItem(icon: "flashlight.on.fill", text: "Flash"),
    ActionItem(icon: "speaker.wave.3.fill", text: "Honk"),
    ActionItem(icon: "key.fill", text: "Start"),
    ActionItem(icon: "arrow.up.bin", text: "Front Trunk"),
    ActionItem(icon: "arrow.up.square", text: "Trunk")
]
struct CarControlView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var toggleValet = false
    var body: some View {
       
            ScrollView{
                VStack(spacing:20) {
                    VStack(alignment:.leading,spacing: 10) {
                        HStack{
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                GeneralButton(icon: "chevron.left")
                            }

                            Spacer()
                        }
                        Text("Car Controls")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    
                    CustomDivider()
                    CarLockButton()
                    CustomDivider()
                    CarControlsAction()
                       CustomDivider()
                    HStack{
                        Text("Valet Mode")
                            .fontWeight(.medium)
                        Spacer()
                        Toggle("",isOn:$toggleValet)
                    }
                }
                .padding()
            }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(Color("DarkGray"))
        .foregroundColor(.white)
        .navigationBarHidden(true)
    }
}

struct CarControlView_Previews: PreviewProvider {
    static var previews: some View {
        CarControlView()
    }
}

struct CarLockButton: View {
    var body: some View {
        Button {
            
        } label: {
            Label("Unlock Car", systemImage: "lock.fill")
                .font(.system(size: 14, weight: .medium, design: .default))
                .frame(maxWidth:.infinity)
                .padding()
                .background(Color.white.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .overlay(RoundedRectangle(cornerRadius: 14,style: .continuous).stroke(Color.white.opacity(0.1),lineWidth: 0.5))
        }

    }
}

struct CarControlsAction: View {
    var body: some View {
        VStack(spacing:20){
            HStack{
                Spacer()
                ActionButton(actionItem: carControl[0])
                Spacer()
                ActionButton(actionItem: carControl[1])
                Spacer()
                ActionButton(actionItem: carControl[2])
                Spacer()
            }
            HStack{
                Spacer()
                ActionButton(actionItem: carControl[3])
                Spacer()
                ActionButton(actionItem: carControl[4])
                Spacer()
            }
        }
        .padding()
    }
}
