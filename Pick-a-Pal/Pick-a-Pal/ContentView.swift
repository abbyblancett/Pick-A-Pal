//
//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Abby Blancett on 5/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Emma", "Ryan", "Mommy", "Daddy", "Adam"]
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemoveName = false
    
    var body: some View {
        VStack {
            VStack{
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
                    
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " ": pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            List {
                ForEach(names, id: \.self) {name in
                    Text(name)
                }
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit{
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemoveName)

            Button {
                if let randomName = names.randomElement(){
                    pickedName = randomName
                    
                    if shouldRemoveName {
                        names.removeAll{ name in
                            return (name == randomName)
                        }
                    }
                } else {
                    pickedName = ""
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
