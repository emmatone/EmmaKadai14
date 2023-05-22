//
//  FruitEditView.swift
//  EmmaKadai14
//
//  Created by Emma
//

import SwiftUI

struct FruitEditView: View {
    @Environment(\.dismiss) var dismiss
    @State var newFruitName: String = ""

    @EnvironmentObject var fruits: Fruits

    var body: some View {
        NavigationStack {
            HStack{
                Text("名前")
                    .padding(.trailing, 20)
                TextField("", text: $newFruitName)
                    .textFieldStyle(.roundedBorder)

            }.padding(50)
            Spacer()

            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save"){
                        // fbを受けて修正
                        // ワイルドカードに戻り値を入れるというか破毀される
                        // 関数の戻り値はこのviewでは必要がないからワイルドカード？
                        // 関数の戻り値がない場合があるからワイルドカード?
//                        let kekka = fruits.addNewFruitIfPossible(newFruitName)

//                        print(kekka)
                        _ = fruits.addNewFruitIfPossible(newFruitName)
                        dismiss()
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.teal.opacity(0.2), for: .navigationBar)
        }
    }
}

struct FruitEditView_Previews: PreviewProvider {
    static var previews: some View {
        FruitEditView()
            .environmentObject(Fruits())
    }
}
