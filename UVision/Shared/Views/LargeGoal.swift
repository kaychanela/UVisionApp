//
//  LargeGoal.swift
//  UVision
//
//  Created by Kayla Anderson on 12/7/23.
//

import Foundation

import SwiftUI

struct LargeGoalView : View {
    @EnvironmentObject var largeGoalViewMode: LargeGoalViewModel
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(largeGoalViewMode.goals) { goal in
                            LargeGoalListView(goal: goal)
                                .background(NavigationLink(destination: LargeGoalDetail(selectedGoal: goal)) {
                                    EmptyView()
                                })
                        }
                    .onDelete(perform: largeGoalViewMode.deleteGoal)
                    .onMove(perform: largeGoalViewMode.moveGoal)
                }.listStyle(PlainListStyle())
                    .navigationTitle("Start Setting Goals! ✩")
                    .navigationBarItems(
                        leading: EditButton(),
                        trailing:
                            NavigationLink("Create Goal", destination: AddLargeGoalView())
                    )
            }.padding(14)
        }
        
    }
}

struct AddLargeGoalView: View{
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var largeGoalViewModel: LargeGoalViewModel
    @State var userTitleInput: String = ""
    @State var userDescriptionInput: String = ""
    @State var userDateInput: Date = Date()
    @State var userAssociatedColor: RGBColor = RGBColor(red: 0, green: 0, blue: 0)
    
    @State var selectedColorIndex: Int = 0
    
    
    let colorOptions: [RGBColor] = [
        RGBColor(red: 255/255, green: 242/255, blue: 204/255), // LightYellow
        RGBColor(red: 159/255, green: 197/255, blue: 232/255), // LightBlue
        RGBColor(red: 180/255, green: 167/255, blue: 214/255), // LightPurple
    ]
    
    var body: some View{
        NavigationView{
            ScrollView{
                VStack{
                    TextField("Name Your Goal: ", text: $userTitleInput)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(red: 243/255, green: 246/255, blue: 244/255))
                        .cornerRadius(10)
                    
                    TextField("Decribe Your Goal: ", text: $userDescriptionInput)
                        .padding(.horizontal)
                        .frame(height: 100)
                        .background(Color(red: 243/255, green: 246/255, blue: 244/255))
                        .cornerRadius(10)
                    
                    DatePicker(selection: $userDateInput, label: { Text("Complete By:") })
                    
                    Picker(selection: $selectedColorIndex, label: Text("Associated Color")) {
                        Text("Light Yellow").tag(0)
                        Text("Light Blue").tag(1)
                        Text("Light Purple").tag(2)
                    }.pickerStyle(.menu)
                    
                    Button(action: saveGoal, label: {
                        Text("SAVE GOAL")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    })
                    
                }.padding(14)
                
            }.navigationTitle("Define Your Goal! ☑")
        }
        
    }
    
    func saveGoal(){
        largeGoalViewModel.addGoal(title: userTitleInput, description: userDescriptionInput, completionDate: userDateInput)
        presentationMode.wrappedValue.dismiss()
    }
}

struct LargeGoalDetail: View {
    @EnvironmentObject var largeGoalViewModel: LargeGoalViewModel
    @State private var isDone: Bool
    let selectedGoal: LargeGoalItem
    
    init(selectedGoal: LargeGoalItem) {
            self.selectedGoal = selectedGoal
            _isDone = State(initialValue: selectedGoal.isDone)
        }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    HStack{
                        Text("Goal:")
                            .font(.title)
                            .foregroundColor(Color.accentColor)
                        Text(selectedGoal.title)
                            .font(.title3)
                    }
                    HStack{
                        Text("Description:")
                            .font(.title)
                            .foregroundColor(Color.accentColor)
                        Text(selectedGoal.description)
                            .font(.title2)
                    }
                    Button(action: {
                        completeLargeGoal(goal: selectedGoal)
                    }) {
                        Text("UPDATE STATUS ☑")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                    
                }
                .padding(.horizontal)
                .frame(height: 400)
                .frame(maxWidth: .infinity)
                .background(Color(red: 243/255, green: 246/255, blue: 244/255))
                .cornerRadius(10)
            }.navigationTitle("Long Term Goal Details✩")
        }
    }
    func completeLargeGoal(goal: LargeGoalItem) {
        if let index = largeGoalViewModel.goals.firstIndex(where: { $0.id == selectedGoal.id }) {
            largeGoalViewModel.goals[index].isDone.toggle()
        }
    }
}

struct LargeGoalDetail_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LargeGoalViewModel()
            LargeGoalDetail(selectedGoal: viewModel.goals[0])
            .environmentObject(viewModel)
    }
}


struct LargeGoalView_Previews: PreviewProvider {
    static var previews: some View {
            LargeGoalView()
            .environmentObject(LargeGoalViewModel())
    }
}

struct AddLargeGoalView_Previews: PreviewProvider {
    static var previews: some View {
            AddLargeGoalView()
        .environmentObject(LargeGoalViewModel())
    }
}


