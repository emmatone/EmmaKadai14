//
//  ContentView.swift
//  EmmaKadai14
//
//  Created by Emma
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var fruits: Fruits
    @State var isPresented: Bool = false

    private let checkMark: some View = Image(systemName: "checkmark").foregroundColor(.orange)

    var body: some View {
        NavigationStack {
            Text("チェック項目を追加する機能")
                .font(.headline)
                .padding(.bottom, 15)
                .padding(.horizontal, 60)
                .frame(maxWidth: .infinity)
                .background(.teal.opacity(0.2))

            List(fruits.fruitsData) { fruit in
                Label{
                    Text(fruit.name)
                } icon: {
                    if fruit.isChecked {
                        checkMark
                    } else {
                        checkMark
                            .hidden()
                    }
                }
            }
            .padding(.vertical, 10)
            .listStyle(.inset)
            .navigationTitle("課題14")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        isPresented = true
                    }){
                        Image(systemName: "plus")
                    }
                    .fullScreenCover(isPresented: $isPresented) {
                        FruitEditView()
                    }

                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Fruits())
    }
}
