//
//  PuassonDistribution.swift
//  X2App
//
//  Created by Roman on 4/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Foundation

class PoissonDirstibution: Distribution {

    private(set) var data: [DataRepresentation]

    init(from data: [DataRepresentation]) {
        self.data = data
    }

    var lambda: Double {
        return data.reduce(0.0) { $0 + Double($1.amount)*$1.start } / Double(data.count)
    }

    func probability(of item: DataRepresentation) -> Double {
        let s = item.start
        return pow(lambda, s)*exp(-lambda) / factorial(s)

    }

    private func factorial(_ item: Double) -> Double {
        return (1...Int(item)).reduce(1.0) { $0 * Double($1) }
    }


}
