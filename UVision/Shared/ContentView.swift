//
//  ContentView.swift
//  Shared
//
//  Created by Kayla Anderson on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 2
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .padding(.top, -100.0)
                    .frame(width: 600.0, height: 50.0)
                    .shadow(radius: /*@START_MENU_TOKEN@*/9/*@END_MENU_TOKEN@*/)
                    .foregroundColor((Color(red: 252/255, green: 234/255, blue: 212/255)))
                
                    
        
                Image("UVLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .padding(.leading, -200.0)
                    .padding(.top, -40.0)
                    .padding(.bottom, -20.0)
            }
            TabView(selection: $selection) {
                LargeGoalView()
                    .tabItem {
                        Image("star")
                    }.tag(1)
                HomepageView()
                    .tabItem {
                        Image("home")
                    }.tag(2)
                SmallGoalView()
                    .tabItem {
                        Image("checkbox")
                    }.tag(3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(LargeGoalViewModel())
        .environmentObject(SmallGoalViewModel())
    }
}
