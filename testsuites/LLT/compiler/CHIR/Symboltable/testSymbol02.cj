// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj %compile_lib_opt

open class C1 {
    public var t1: Int64

    public init(values: Int64) {
        t1 = values
    }

    public func test() {
        t1 = 1
    }
}

func test1(v1: Int64, v2: Int64) {
    var a = v1
}

public interface A {
    func test2(right: Int64): Int64
}

extend Int64 <: A {
    public func test2(right: Int64): Int64 {
        5
    }
}

main(): Int64 {
    0
}
