/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type A = classA

class classA {
    public var a: Int64 = 1
}

class classB {}

extend classB {
    public func a(a: A) {
        return a
    }
}

main(): Int64 {
    if (classB().a(A()).a == 1) {
        return 0
    } else {
        return 1
    }
}
