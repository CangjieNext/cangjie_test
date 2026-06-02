// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public class C {
    public var t0: Int64

    init(t0_: Int64) {
        t0 = t0_
    }
}

public func foo(x: C) {
    x.t0 = 5
}

public let c0 = C(1)
public var c1 = C(3)
