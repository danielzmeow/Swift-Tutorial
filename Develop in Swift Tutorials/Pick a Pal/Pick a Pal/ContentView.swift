//
//  ContentView.swift
//  Pick a Pal
//
//  Created by Daniel Zhang on 12/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var nameToAdd: String = ""
    @State private var pickedName: String = ""
    @State private var removeWhenPicked: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person.3.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick a Pal")
            }
            .font(.largeTitle.bold())
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2.bold())
                .foregroundStyle(.tint)
            
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack {
                
                TextField("Add Name", text: $nameToAdd)
                    .autocorrectionDisabled()
                    .onSubmit {
                        if !nameToAdd.isEmpty && !names.contains(nameToAdd) {
                            names.append(nameToAdd)
                            nameToAdd = ""
                        }
                    }
                
                Divider()
                
                Toggle("Remove when picked", isOn: $removeWhenPicked)
                    .padding(.bottom)
            }
            .padding()
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if removeWhenPicked {
                        // remove all name in names -> which name satisfy {name == pickedName}
                        
                        names.removeAll { name in
                            name == pickedName
                        }
                    }
                    
                } else {
                    pickedName = " "
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
