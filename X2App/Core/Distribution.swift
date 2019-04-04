//
//  Distribution.swift
//  X2App
//
//  Created by Roman on 4/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Foundation

protocol Distribution {
    var data: [DataRepresentation] { get set }
    var lambda: Double { get }
    func probability(of item: DataRepresentation) -> Double
}

extension Distribution {
    mutating func regroup() {
        let totalAmount = data.reduce(0.0) { $0 + Double($1.amount) }
        var index = 0
        while index < data.count {
            if  data[index].amount < 5 && totalAmount*probability(of: data[index]) < 10 { // check, do we need to merge to the right next
                let current = data.remove(at: index)
                data[index] = DataRepresentation.init(start: current.start,
                                                      finish: data[index].finish,
                                                      amount: current.amount + data[index].amount)
            }
            index += 1
        }
        // check last element of item
        if  data[index].amount < 5 && totalAmount*probability(of: data[index]) < 10 {
            let current = data.remove(at: data.count - 1)
            data[data.count - 1] = DataRepresentation.init(start: data[data.count - 1].start,
                                                           finish: current.finish,
                                                           amount: current.amount + data[data.count - 1].amount)
        }
    }
}
