// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-1 A
// ASSERT: scan-1 getter
// ASSERT: scan-1 setter

class A {
    mut prop v: Int64 {
        get() {
            println("getter");
            1
        }
        set(v) {
            println("setter")
        }
    }
}

func get(): A {
    println("A")
    A()
}

func coo(a: Any) {}

main() {
    coo(get().v += 1) // get().$vset(get().$vget() + 1) 
}