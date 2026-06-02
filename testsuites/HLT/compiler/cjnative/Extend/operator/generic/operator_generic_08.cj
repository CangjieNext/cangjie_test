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
    var a: Data<Int32> = Data<Int32>()
    if (a + Int64(1) != 0) {
        return 1
    }
    if (a - Int32(1) != 1) {
        return 1
    }
    return 0
}

class Data<T> {}

extend<T> Data<T> {
    public operator func +(right: Int64): UInt8 {
        return 0
    }
    public operator func -(right: T): T {
        return right
    }
}
