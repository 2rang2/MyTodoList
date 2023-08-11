//
//  DataManager.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/07.
//

import Foundation

class DataManager {
    var data: [Data] = [
        Data(title: "알고리즘 풀기", description: "프로그래머스 입문", isCompleted: false),
        Data(title: "TIL 작성하기", description: "Velog", isCompleted: false),
        Data(title: "질문 & 피드백", description: "Gather", isCompleted: false)
    ]
    
    func completeList() -> [Data] {
        return data.filter { $0.isCompleted == true }
    }
}
