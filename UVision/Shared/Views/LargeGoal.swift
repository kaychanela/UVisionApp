//
//  LargeGoal.swift
//  UVision
//
//  Created by Kayla Anderson on 12/7/23.
//

import Foundation

import SwiftUI


// View for displaying a list of large goals
struct LargeGoalView : View {
    @EnvironmentObject var largeGoalViewMode: LargeGoalViewModel
    var body: some View {
        NavigationView{
            VStack {
                List{
                    // Iterate over large goals and display each in LargeGoalListView
                    ForEach(largeGoalViewMode.goals) { goal in
                            LargeGoalListView(goal: goal)
                                .background(NavigationLink(destination: LargeGoalDetail(selectedGoal: goal)) {
                                    EmptyView()
                                })
                        }
                    // Enable deletion and reordering of goals
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

// View for adding a new large goal
struct AddLargeGoalView: View{
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var largeGoalViewModel: LargeGoalViewModel
    
    // Input fields for the new goal
    @State var userTitleInput: String = ""
    @State var userDescriptionInput: String = ""
    @State var userDateInput: Date = Date()
    @State var userAssociatedColor: RGBColor = RGBColor(red: 0, green: 0, blue: 0)
    // Index of the selected color from the colorOptions array
    @State var selectedColorIndex: Int = 0
    
    // Array of predefined RGB colors for selection
    let colorOptions: [RGBColor] = [
        RGBColor(red: 255/255, green: 242/255, blue: 204/255), // LightYellow
        RGBColor(red: 159/255, green: 197/255, blue: 232/255), // LightBlue
        RGBColor(red: 180/255, green: 167/255, blue: 214/255), // LightPurple
    ]
    
    var body: some View{
        NavigationView{
            ScrollView{
                VStack{
                    // Input field for goal title
                    TextField("Name Your Goal: ", text: $userTitleInput)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(red: 243/255, green: 246/255, blue: 244/255))
                        .cornerRadius(10)
                    // Input field for goal description
                    TextField("Decribe Your Goal: ", text: $userDescriptionInput)
                        .padding(.horizontal)
                        .frame(height: 100)
                        .background(Color(red: 243/255, green: 246/255, blue: 244/255))
                        .cornerRadius(10)
                    
                    // Date picker for setting completion date
                    DatePicker(selection: $userDateInput, label: { Text("Complete By:") })
                    
                    // Picker for selecting associated color
                    Picker(selection: $selectedColorIndex, label: Text("Associated Color")) {
                        Text("Light Yellow").tag(0)
                        Text("Light Blue").tag(1)
                        Text("Light Purple").tag(2)
                    }.pickerStyle(.menu)
                    
                    // Button to save the new goal
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
    // Function to save the new goal
    func saveGoal(){
        largeGoalViewModel.addGoal(title: userTitleInput, description: userDescriptionInput, completionDate: userDateInput)
        presentationMode.wrappedValue.dismiss()
    }
}

// View for displaying details of a large goal
struct LargeGoalDetail: View {
    @EnvironmentObject var largeGoalViewModel: LargeGoalViewModel
    @State private var isDone: Bool
    let selectedGoal: LargeGoalItem
    
    
    // Initialize LargeGoalDetail with the selected goal
    init(selectedGoal: LargeGoalItem) {
            self.selectedGoal = selectedGoal
            _isDone = State(initialValue: selectedGoal.isDone)
        }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                    // Display goal title
                    HStack{
                        Text("Goal:")
                            .font(.title2)
                            .foregroundColor(Color.accentColor)
                        Text(selectedGoal.title)
                            .font(.title3)
                    }
                    // Display goal description
                    HStack{
                        Text("Description:")
                            .font(.title2)
                            .foregroundColor(Color.accentColor)
                        Text(selectedGoal.description)
                            .font(.title2)
                    }
                    // Display goal completion date
                    HStack {
                        Text("Complete By:")
                            .font(.title2)
                            .foregroundColor(Color.accentColor)
                        Text(formatDate(date: selectedGoal.compeltionDate))
                            .font(.title2)
                    }
                    // Button to update the status of the goal
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
    // Function to update the completion status of the goal
    func completeLargeGoal(goal: LargeGoalItem) {
        if let index = largeGoalViewModel.goals.firstIndex(where: { $0.id == goal.id }) {
            largeGoalViewModel.goals[index].isDone.toggle()
        }
    }
    // Function to convert date to a string format
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

// Preview provider for LargeGoalDetail
struct LargeGoalDetail_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LargeGoalViewModel()
            LargeGoalDetail(selectedGoal: viewModel.goals[0])
            .environmentObject(viewModel)
    }
}

// Preview provider for LargeGoalView
struct LargeGoalView_Previews: PreviewProvider {
    static var previews: some View {
            LargeGoalView()
            .environmentObject(LargeGoalViewModel())
    }
}
// Preview provider for AddLargeGoalView
struct AddLargeGoalView_Previews: PreviewProvider {
    static var previews: some View {
            AddLargeGoalView()
        .environmentObject(LargeGoalViewModel())
    }
}


