// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public interface IFunc {
    func apply(x: Int64): Int64

    func apply(x: Int64, lam: (Int64) -> Int64): Int64 {
        lam(x)
    }
}

class funcImpl <: IFunc {
    var f: (Int64) -> Int64
    public init(f: (Int64) -> Int64) {
        this.f = f
    }
    public func apply(x: Int64): Int64 {
        f(x)
    }
}

public class A {
    public let f: IFunc = funcImpl({x => x * 2})
}
