// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public let a = 1
public var b = 2

public func koo(sa: SA) {
    sa.dump()
}

public struct SA {
    var num: Int64
    public var c = 9
    public init(x: Int64) {
        num = x
    }
    func foo(): Int64 {
        a + b + num
    }
}

extend SA {
    public func dump() {
        foo()
    }
}
