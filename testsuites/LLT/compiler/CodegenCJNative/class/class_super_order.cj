// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan 1234
func first() {
    print("1")
}

func second() {
    print("2")
}

func third() {
    print("3")
}

func fourth() {
    print("4")
}

open class A {
    public var a = second()
    public init() {
        third()
    }
}

class B <: A {
    public var b = first()
    public init() {
        super()
        fourth()
    }
}

main() {
    B()
    return 0
}
