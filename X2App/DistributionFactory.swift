//
//  DistributionFactory.swift
//  X2App
//
//  Created by Roman on 4/4/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Foundation


func distributionFactory(from data: [DataRepresentation]) -> Distribution {
    return data[0].finish - data[0].start == 0.0 ? PoissonDirstibution(from: data) : ExponentialDistribution(from: data)
}
