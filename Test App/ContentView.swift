//
//  ContentView.swift
//  Test App
//
//  Created by David Comer on 4/30/22.
//

import SwiftUI

struct ContentView: View {
    @State var todoData: String = ""
    @State var allItems = [Items]()
    func deleteItem(at offSets: IndexSet) {
        allItems.remove(atOffsets:  offSets)
    }
    var body: some View {
        VStack {
            Text("Todo")
                .foregroundColor(.blue)
            TextField("Things to do", text: $todoData)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            ZStack {
                List {
                    ForEach(self.allItems, id: \.date) {item in
                        Text(item.data)
                    }
                    .onDelete(perform: deleteItem)
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            if (todoData != "") {
                                self.allItems.append(Items(data: todoData))
                                todoData = ""
                            }
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .center)
                                .padding()
                        })
                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
                    }
                }
            }
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ButtonImage: View {
    
    let imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .frame(width: 60, height: 60, alignment: .center)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
