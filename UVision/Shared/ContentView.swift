//
//  ContentView.swift
//  Shared
//
//  Created by Kayla Anderson on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    // State variable to track the selected tab
    @State private var selection = 2
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .padding(.top, -100.0)
                    .frame(width: 600.0, height: 50.0)
                    .shadow(radius: /*@START_MENU_TOKEN@*/9/*@END_MENU_TOKEN@*/)
                    .foregroundColor((Color(red: 252/255, green: 234/255, blue: 212/255)))
                
                // Logo image placed in the header
                Image("UVLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .padding(.leading, -200.0)
                    .padding(.top, -40.0)
                    .padding(.bottom, -20.0)
            }
            // TabView for displaying different views based on the selected tab
            TabView(selection: $selection) {
                // LargeGoalView as the content of the first tab
                LargeGoalView()
                    .tabItem {
                        Image("star")
                    }.tag(1)
                // HomepageView as the content of the second tab
                HomepageView()
                    .tabItem {
                        Image("home")
                    }.tag(2)
                // SmallGoalView as the content of the third tab
                SmallGoalView()
                    .tabItem {
                        Image("checkbox")
                    }.tag(3)
            }
        }
    }
}

// Preview provider for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview ContentView with environment objects for LargeGoalViewModel and SmallGoalViewModel
        ContentView()
            .environmentObject(LargeGoalViewModel())
            .environmentObject(SmallGoalViewModel(largeGoalViewModel: LargeGoalViewModel()))
    }
}
