//
//  String.swift
//  Quiz_SwiftUI
//
//  Created by Juan on 11/10/21.
//

import Foundation

infix operator =+-= : ComparisonPrecedence

extension String{

func loweredTrimmed () -> String{
    self.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
}

func isLoweredTrimmedEqual(_ str: String) -> Bool {
    self.loweredTrimmed() == str.loweredTrimmed()
}

static func =+-= (s1: String, s2: String) -> Bool {
    s1.isLoweredTrimmedEqual(s2)
}

}
