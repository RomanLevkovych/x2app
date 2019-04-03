//
//  ExponentialDistribution.swift
//  X2App
//
//  Created by Roman on 4/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Foundation

class ExponentialDistribution: Distribution {
    var data: [DataRepresentation] = []

    var lambda: Double { return 1.0 / data.reduce(0.0) { $0 + Double($1.amount) } } // TODO: - calculate average of continious distribution

    func probability(of item: DataRepresentation) -> Double {
        return distributionFunction(of: item.finish) - distributionFunction(of: item.start)
    }

    private func distributionFunction(of item: Double) -> Double {
        return item > 0 ? 1 - exp(-lambda) : 0
    }

}
