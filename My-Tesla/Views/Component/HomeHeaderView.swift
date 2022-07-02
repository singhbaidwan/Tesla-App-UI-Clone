//
//  HomeHeaderView.swift
//  My-Tesla
//
//  Created by Dalveer singh on 02/07/22.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack{
            VStack(alignment:.leading,spacing:10){
                Text("Model 3".uppercased())
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .padding(.vertical,4)
                    .padding(.horizontal,8)
                    .background(Color("Red"))
                    .clipShape(Capsule())
                    .foregroundColor(Color.white)
                Text("Dalveer Singh")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
            }
            Spacer()
            HStack{
                GeneralButton(icon: "lock.fill")
                GeneralButton(icon: "gear")
            }
        }
    }
}


struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}

