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

func test<T>(a: T) {
    return 1
}

class A<T> {
    public func test(a: T) {
        return 2
    }
    public func i(input: T) {
        var I = test(input)
        return I
    }
}

main(): Int64 {
    var I = A<Int64>().i(1)
    if (I != 2) {
        return 1
    }
    return 0
}
