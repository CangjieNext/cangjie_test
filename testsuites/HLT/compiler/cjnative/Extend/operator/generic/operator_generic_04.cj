/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a: Option<Int32> = Some(1)
    if (a + Int32(1) != 0) {
        return 1
    }
    if (a - Int32(1) != 1) {
        return 2
    }
    return 0
}

extend<T> Option<T> {
    public operator func +(right: T): UInt8 {
        return 0
    }
    public operator func -(right: T): T {
        return right
    }
}
