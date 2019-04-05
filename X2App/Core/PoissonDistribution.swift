//
//  PuassonDistribution.swift
//  X2App
//
//  Created by Roman on 4/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Foundation

class PoissonDirstibution: Distribution {
    var data: [DistributionData]
    var lambda: Double
    var degreesOfFreedom: Int

    init(from dr: [DataRepresentation]) {
        data = []
        lambda = dr.reduce(0.0) { $0 + Double($1.amount)*$1.start } / dr.reduce(0.0) { $0 + Double($1.amount) }
        degreesOfFreedom = dr.count - 1
        data = dr.map { ($0, probability(of: $0)) }
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
