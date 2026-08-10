// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

open class Public_C {
    public let v1: Int64
    public init() {
        this.v1 = 1
    }
    public init(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        this.v1 = a
    }

    const init(a: Int64, b: Int64, c: Int64) {
        this.v1 = a
    }
    public const func getC1(a: Int64, b: Int64, c: Int64) {
        let class1 = Public_C(a, b, c)
        1
    }

    init(a: Byte, b: Byte, c: Byte) {
        this.v1 = 1
    }
    @Frozen
    public func getC2() {
        let class2 = Public_C(1, 2, 3)
        class2
    }
}
public class A <: Public_C {
    let a: Int64 = 20

    public init() {}
}