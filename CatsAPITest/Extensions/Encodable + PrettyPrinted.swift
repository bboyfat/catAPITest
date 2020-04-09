//
//  Encodable + PrettyPrinted.swift
//  CatsAPITest
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

extension Encodable {
    func prettyPrintedObj() -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(self)
        return String("\(try? JSONSerialization.jsonObject(with: data, options: []))")
    }
}
