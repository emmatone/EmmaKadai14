//
//  Model.swift
//  EmmaKadai14
//
//  Created by Emma
//

import Foundation

struct Fruit: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}

class Fruits: ObservableObject {
    @Published var fruitsData = [
        Fruit(name: "りんご", isChecked: false),
        Fruit(name: "みかん", isChecked: true),
        Fruit(name: "バナナ", isChecked: false),
        Fruit(name: "パイナップル", isChecked: true)
    ]
    // fbを受け修正
    // 関数を呼び出しても追加されない場合があるということが分かる名前に変更。<= 関数名は分かりやすくする
    // 追加できたか否かをBoolで返す。<= 戻り値を明確にする
    func addNewFruitIfPossible(_ fruitName: String) -> Bool {
        // 文字列の両端から空白を削除
        let trimediFruitName = fruitName.trimmingCharacters(in: .whitespaces)
        // 文字列が空ではない時だけ追加する
        if !trimediFruitName.isEmpty {
            fruitsData.append(Fruit(name: trimediFruitName))
            return true
        } else {
            return false
        }
    }
}
