/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public interface fatherInterface {
    mut func foo2(a!: UInt64): UInt64 {
        a
    }
}

interface MyInterface <: fatherInterface {
    mut func foo2(a!: UInt64): UInt64 {
        a + a
    }
}

extend UInt32 <: MyInterface {}

main() {
    var u1: MyInterface = UInt32(1)
    var u2: UInt32 = 1
    if (u1.foo2(a: 1) == 2 && u2.foo2(a: 2) == 4) {
        return 0
    } else {
        return 1
    }
}
