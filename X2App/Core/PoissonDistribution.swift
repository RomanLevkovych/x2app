//
//  PuassonDistribution.swift
//  X2App
//
//  Created by Roman on 4/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Foundation

class PoissonDirstibution: Distribution {

    var data: [DataRepresentation]

    init(from data: [DataRepresentation]) {
        self.data = data
    }

    var lambda: Double {
        return data.reduce(0.0) { $0 + Double($1.amount)*$1.start } / data.reduce(0.0) { $0 + Double($1.amount) }
    }

    func probability(of item: DataRepresentation) -> Double {
        let s = item.start
        return pow(lambda, s)*exp(-lambda) / factorial(s)

    }

    private func factorial(_ item: Double) -> Double {
        if item == 0.0 { return 1.0 }
        return (1...Int(item)).reduce(1.0) { $0 * Double($1) }
    }

}
