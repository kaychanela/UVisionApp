//
//  SmallGoal.swift
//  UVision
//
//  Created by Kayla Anderson on 12/5/23.
//

import Foundation

import SwiftUI

struct SmallGoalView: View {
    @EnvironmentObject var smallGoalViewModel: SmallGoalViewModel
    @EnvironmentObject var largeGoalViewModel: LargeGoalViewModel
    var body: some View {
        NavigationView{
            VStack {
                List {
                    ForEach(smallGoalViewModel.goals) { goal in
                        SmallGoalListView(goal: goal)
                            .background(NavigationLink(destination: SmallGoalDetail(selectedGoal: goal)) {
                                EmptyView()
                            })
                    }
                    .onDelete(perform: smallGoalViewModel.deleteGoal)
                    .onMove(perform: smallGoalViewModel.moveGoal)
                }.listStyle(PlainListStyle())
                .navigationTitle("Set small goals! ✩")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        NavigationLink("Create Goal", destination: AddSmallGoalView())
                )
            }.padding(14)
        }
    }
}

struct AddSmallGoalView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var smallGoalViewModel: SmallGoalViewModel
    @EnvironmentObject var largeGoalViewModel: LargeGoalViewModel
    @State var userTitleInput: String = ""
    @State var userDescriptionInput: String = ""
    
    @State var selectedLargeGoal: LargeGoalItem? = nil
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    TextField("Name Your Small Goal: ", text: $userTitleInput)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(red: 243/255, green: 246/255, blue: 244/255))
                        .cornerRadius(10)
                    
                    TextField("Describe Your Small Goal: ", text: $userDescriptionInput)
                        .padding(.horizontal)
                        .frame(height: 100)
                        .background(Color(red: 243/255, green: 246/255, blue: 244/255))
                        .cornerRadius(10)
                    
                    Picker(selection: $selectedLargeGoal, label: Text("Select Large Goal")) {
                                ForEach(largeGoalViewModel.goals) { goal in
                                    Text(goal.title).tag(goal)
                                }
                            }
                            .pickerStyle(.menu)
                    
                    
                    Button(action: saveSmallGoal, label: {
                        Text("SAVE SMALL GOAL")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    })
                }
                .padding(14)
            }
            .navigationTitle("Define Your Small Goal")
        }
    }
    
    func saveSmallGoal() {
        smallGoalViewModel.addGoal(title: userTitleInput, description: userDescriptionInput, largeGoal: selectedLargeGoal)
        presentationMode.wrappedValue.dismiss()
    }
}

struct SmallGoalDetail: View {
    @EnvironmentObject var smallGoalViewModel: SmallGoalViewModel
    @EnvironmentObject var largeGoalViewModel: LargeGoalViewModel
    let selectedGoal: SmallGoalItem
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Small Goal:")
                            .font(.title)
                            .foregroundColor(Color.accentColor)
                        Text(selectedGoal.title)
                            .font(.title3)
                    }.padding(.vertical, 2.0)
                    HStack {
                        Text("Description:")
                            .font(.title)
                            .foregroundColor(Color.accentColor)
                        Text(selectedGoal.description)
                            .font(.title2)
                    }.padding(.vertical, 2.0)
                    HStack {
                        Text("Main Goal:")
                            .font(.title)
                            .foregroundColor(Color.accentColor)
                        Text(selectedGoal.largeGoal?.title ?? "None")
                            .font(.title2)
                    }.padding(.vertical, 8.0)
                    Button(action: {
                        completeGoal(goal: selectedGoal)
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
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .background(Color(red: 243/255, green: 246/255, blue: 244/255))
                .cornerRadius(10)
            }
            .navigationTitle("Small Goal Details: ✩")
        }
    }
    func completeGoal(goal: SmallGoalItem) {
        if let index = smallGoalViewModel.goals.firstIndex(where: { $0.id == goal.id }) {
            smallGoalViewModel.goals[index].isDone.toggle()
        }
    }
}


struct SmallGoalDetail_Previews: PreviewProvider {
    static var previews: some View {
        let largeGoalViewModel = LargeGoalViewModel()
        let smallGoalViewModel = SmallGoalViewModel(largeGoalViewModel: largeGoalViewModel)
        
        return SmallGoalDetail(selectedGoal: smallGoalViewModel.goals[0])
            .environmentObject(largeGoalViewModel)
            .environmentObject(smallGoalViewModel)
    }
}

struct SmallGoalView_Previews: PreviewProvider {
    static var previews: some View {
            SmallGoalView()
            .environmentObject(LargeGoalViewModel())
            .environmentObject(SmallGoalViewModel(largeGoalViewModel: LargeGoalViewModel()))
    }
}

struct AddSmallGoalView_Previews: PreviewProvider {
    static var previews: some View {
            AddSmallGoalView()
            .environmentObject(LargeGoalViewModel())
            .environmentObject(SmallGoalViewModel(largeGoalViewModel: LargeGoalViewModel()))

    }
}
