// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args
@C
struct A {
    var z: Int64
    init(t: Int64) {
        z = t
    }
    public func toString() {
        z.toString()
    }
}

struct B {
    var z: Int64
    init(t: Int64) {
        z = t
    }
    public func toString() {
        z.toString()
    }
}

var xxx = if (true) {
    (A(111), B(44))
} else {
    (A(1), B(2))
}

main(): Int64 {
    var (a_, b_) = xxx
    println("after:${a_.toString()},${b_.toString()}")
    if (a_.toString() != "111" || b_.toString() != "44") {
        return 1
    }
    return 0
}
