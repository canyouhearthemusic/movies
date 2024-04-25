//
//  NSObject + Ext.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

extension NSObject {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
