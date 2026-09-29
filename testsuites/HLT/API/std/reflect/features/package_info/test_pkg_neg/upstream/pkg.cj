/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package upstream

public class HelperA {
    public init() {}
}

public interface IProbe {
    func ping(): Int64
}

public struct Point {
    public var x: Int64
    public var y: Int64
    public init(x: Int64, y: Int64) {
        this.x = x
        this.y = y
    }
}

public func probeAdd(a: Int64, b: Int64): Int64 {
    return a + b
}

public func probeMul(a: Int64, b: Int64): Int64 {
    return a * b
}

public var probeCounter: Int64 = 42

public let probeLabel: String = "upstream"
