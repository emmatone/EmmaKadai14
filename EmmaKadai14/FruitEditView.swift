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
                        /* Swiftは、戻り値が存在する関数に対してはその戻り値を適切に扱うことを強制します。
                        しかし、全ての関数の戻り値が常に必要というわけではありません。
                         ある関数の戻り値があるにも関わらず、それを使う予定がない場合や、
                         単にその戻り値が今のところ関係ない場合があります。このような場合に、
                         Swiftでは _ = を使って、あえてその戻り値を受け取らない（無視する）ことを明示的に表現します。
                         */
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
