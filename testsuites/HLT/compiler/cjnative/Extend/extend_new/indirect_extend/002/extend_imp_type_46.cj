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

type TI = I

extend classA <: TI {
    public operator func +(b: classA): Int64 {
        0
    }
}

interface I {
    operator func +(b: classA): Int64 {
        0
    }
}

class classA {
    public var a: Int64 = 1
}

class classB {}

extend classB {
    public func a(a: classA) {
        return a
    }
}

main(): Int64 {
    print((classB().a(classA()) + classB().a(classA())).toString())
    if (classB().a(classA()) + classB().a(classA()) == 0) {
        return 0
    } else {
        return 1
    }
}
