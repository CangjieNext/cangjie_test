// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC-8: %run %run_opt %n.%suffix

open class CB {
    var abc: Int64
    init(y: Int64) {
        abc = y
    }
}

open class CA <: CB & I1 {
    init(y: Int64) {
        super(y)
    }
}

interface I1 {}

class CC <: CA {
    init(y: Int64) {
        super(y)
    }
}

struct SA<T> where T <: I1 & CB & CA {
    var x: T
    init(y: T) {
        x = y
    }
    func fff() {
        x.abc
    }
}

main() {
    SA<CC>(CC(8)).fff()
}
