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

public interface MyInterface<T> {
    mut func foo1(): UInt16 {
        1
    }
}

extend UInt8 <: MyInterface<Float64> {}

main() {
    var u1: MyInterface<Float64> = UInt8(1)
    var u2: UInt8 = 1

    if (u1.foo1() == 1 && u2.foo1() == 1) {
        return 0
    } else {
        return 1
    }
}
