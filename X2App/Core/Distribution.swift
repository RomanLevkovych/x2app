//
//  Distribution.swift
//  X2App
//
//  Created by Roman on 4/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Foundation

protocol Distribution {
    var data: [DistributionData] { get set }
    var lambda: Double { get }
    func probability(of item: DataRepresentation) -> Double
    func chiSquaredEmpiric() -> Double
}

extension Distribution {
    func chiSquaredEmpiric() -> Double {
        let total = data.reduce(0.0) { $0 + Double($1.dataInfo.amount) }

        return data.reduce(0.0) { $0 +
            pow(Double($1.dataInfo.amount) - total * probability(of: $1.dataInfo), 2) / (total * probability(of: $1.dataInfo)) }
    }

    mutating func regroup() {
        let totalAmount = data.reduce(0.0) { $0 + Double($1.dataInfo.amount) }
        var index = 0
        while index < data.count {
            if  data[index].dataInfo.amount < 5 && totalAmount*probability(of: data[index].dataInfo) < 10 { // check, do we need to merge to the right next
                let current = data.remove(at: index)
                data[index] = (DataRepresentation.init(start: current.dataInfo.start,
                                                      finish: data[index].dataInfo.finish,
                                                      amount: current.dataInfo.amount + data[index].dataInfo.amount),
                               data[index].probability+current.probability)
            }
            index += 1
        }
        // check last element of item
        if  data[data.count - 1].dataInfo.amount < 5 && totalAmount*probability(of: data[data.count - 1].dataInfo) < 10 {
            let current = data.remove(at: data.count - 1)
            data[data.count - 1] = (DataRepresentation.init(start: data[data.count - 1].dataInfo.start,
                                                           finish: current.dataInfo.finish,
                                                           amount: current.dataInfo.amount + data[data.count - 1].dataInfo.amount),
                                    data[data.count - 1].probability + current.probability)
        }
    }
}
