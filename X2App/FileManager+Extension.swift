//
//  FileManager+Extension.swift
//  X2App
//
//  Created by Roman on 4/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Foundation

extension FileManager {
    func parse(file path: URL) throws -> [DataRepresentation] {
        let data = try String(contentsOf: path)
        let info = data.split(separator: "\n").compactMap { $0.split(separator: " ") }

        return (0..<info[0].count).map { index in
            let s = Double(info[0][index])!
            let f = Double(info[1][index])!
            let d = Int(info[2][index])!
            return DataRepresentation.init(start: s, finish: f, amount: d)
        }
    }
}
