// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt -g %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan 1
// ASSERT: scan 10

struct S<T> {
    var x: Int64 = 1
    public mut func f(): Int64 {
        x = 10
        return x
    }

    public mut func foo2(): Int64 {
        f()
    }
}

main() {
    var struct3: S<Int64> = S<Int64>()
    println(struct3.x)
    struct3.foo2()
    println(struct3.x)
}
