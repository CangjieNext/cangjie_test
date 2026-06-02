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

class A {
    public func test(a: Int64) {
        return 2
    }
    public func i() {
        var I = test(1)
        return I
    }
}

main(): Int64 {
    var I = A().i()
    if (I != 2) {
        return 1
    }
    return 0
}
