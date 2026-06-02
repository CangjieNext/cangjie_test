// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public class CA<T> {
    public var b: T
    public init(param1: T) {
        b = param1
    }
    public func foo<T>(x: T): T {
        x
    }
}

func test(x: Int64, y: String): Int64 {
    var ca = CA<Int64>(x)
    ca.foo<Int64>(x)
    return 1
}

main() {
    test(1, "2")
}
