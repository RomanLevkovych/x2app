//
//  Distribution.swift
//  X2App
//
//  Created by Roman on 4/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Foundation

protocol Distribution {
    var data: [DataRepresentation] { get }
    var lambda: Double { get }
    func probability(of item: DataRepresentation) -> Double
}

extension Distribution {
    func regroup() {
//        for index in 0..<data.count {
//            if Double(data[index].amount) * probability(of: data[index]) < 5 {
//                return
//            }
//        }
        // TODO: implement regrouping of data
        // if amount < 5 or totalAmount * probability_i < 10 then merge to the right next
        // if it is the last one than we'll merge with previous one
    }
}
