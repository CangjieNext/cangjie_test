/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0-core
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package %f -o %output

import stdx.actors.*
import stdx.actors.macros.*

@Actor
class MyActor {
    public static let m: Int64 = 0
    internal static let n: Int64 = 1
    private static let o: Int64 = 2

    public static func getM(): Int64 {
        m
    }
    internal static func getN(): Int64 {
        n
    }
    private static func getO(): Int64 {
        o
    }

    static init() {}

    public let x: Int64 = 40
    internal let y: Int64 = 41
    private let z: Int64 = 42

    public func getX(): Int64 {
        x
    }
    internal func getY(): Int64 {
        y
    }
    private func getZ(): Int64 {
        z
    }

    init() {}
}

main() {}
