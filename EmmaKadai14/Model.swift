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

    func addNewFruit(_ fruitName: String) {
        // 文字列の両端から空白を削除
        let trimediFruitName = fruitName.trimmingCharacters(in: .whitespaces)
        // 文字列が空ではない時だけ追加する
        if trimediFruitName != "" {
            fruitsData.append(Fruit(name: trimediFruitName))
        }
    }

}
