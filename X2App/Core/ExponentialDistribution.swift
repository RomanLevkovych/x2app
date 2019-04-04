//
//  ExponentialDistribution.swift
//  X2App
//
//  Created by Roman on 4/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Foundation

class ExponentialDistribution: Distribution {
    var data: [DistributionData] // TODO: create init from [DataRepresentation]
    var lambda: Double

    init(from dr: [DataRepresentation]) {
        data = [DistributionData]()
        lambda = 1.0 / dr.reduce(0.0) { $0 + ($1.finish - $1.start) / 2.0 * Double($1.amount) }
        data = dr.map { ($0, probability(of: $0)) }
    }

     // TODO: - calculate average of continious distribution

    func probability(of item: DataRepresentation) -> Double {
        return distributionFunction(of: item.finish) - distributionFunction(of: item.start)
    }

    private func distributionFunction(of item: Double) -> Double {
        return item > 0 ? 1 - exp(-lambda*item) : 0
    }

}
