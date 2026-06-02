// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt 2>&1 %f >a.t
// (Linux) EXEC: [[ $(wc -l a.t | awk '{print $1}') -eq 0 ]]

open class A {
    init(a: Int64) {
        println("Int64: ${a}")
    }
    init(a: Int32) {
        this(Int64(a))
    }
}

class B <: A {
    B() {
        super(Int32(3))
    }
}

main() {
    A(9)
    ()
}
