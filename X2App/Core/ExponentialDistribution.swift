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
    var degreesOfFreedom: Int

    init(from dr: [DataRepresentation]) {
        var drcpy = dr
        data = [DistributionData]()
        degreesOfFreedom = dr.count - 1
        let s = sqrt(3.0 * dr.reduce(0.0) { $0 + ($1.finish - $1.start) / 2.0 * Double($1.amount) } / (dr.reduce(0.0) { $0 + Double($1.amount) } - 1))
        lambda = dr.reduce(0.0) { $0 + Double($1.amount) } / dr.reduce(0.0) { $0 + ($1.finish - $1.start) / 2.0 * Double($1.amount) }
        drcpy[0] = DataRepresentation.init(start: 1.0/lambda - s, finish: drcpy[0].finish, amount: dr[0].amount)
        drcpy[drcpy.count - 1] = DataRepresentation.init(start: drcpy[drcpy.count - 1].start, finish: 1.0/lambda + s, amount: drcpy[drcpy.count - 1].amount)
        data = dr.map { ($0, probability(of: $0)) }
    }

    func probability(of item: DataRepresentation) -> Double {
        return distributionFunction(of: item.finish) - distributionFunction(of: item.start)
    }

    private func distributionFunction(of item: Double) -> Double {
        return item > 0 ? 1 - exp(-lambda*item) : 0
    }

}
