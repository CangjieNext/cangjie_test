/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC: %run %run_opt %output %run_args

class A {
    public var num: IntNative = 0

    public operator func [](index: IntNative): IntNative {
        return this.num + index
    }

    public operator func [](index: IntNative, value!: IntNative): Unit {
        this.num = index + value
    }
}

main(): IntNative {
    var a: A = A()
    print("${a[2]}\n") // invoke operator func [](x: A, index: IntNative): IntNative
    a[2] = 5 // invoke operator func [](x: A, index: IntNative, value: IntNative): Unit
    print("${a[1]}")
    return 0
}
