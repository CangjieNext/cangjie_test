/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

interface I {
    mut func f(): Unit
}

struct Foo <: I {
    public var v = 0
    public mut func f(): Unit {
        v += 1
    }

    public operator func ==(b: Foo) {
        return this.v == b.v
    }
}

main() {
    var a = Foo()
    let aa = Foo()
    match (a) {
        case aa => aa.f()
        case _ => a.f()
    }

    return a.v - 5
}
// ASSERT: scan sema_immutable_access_mutable_func
// ASSERT: scan sema_unreachable_pattern
