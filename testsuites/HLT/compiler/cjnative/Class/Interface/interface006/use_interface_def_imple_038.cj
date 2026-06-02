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

var p1 = 0
var p2 = 0

interface faterInterface<T> {
    mut prop b1: Int64 {
        get() {
            1
        }
        set(value) {
            p1 = value
        }
    }
}

interface MyInterface<T> <: faterInterface<T> {
    mut prop b2: Int64 {
        get() {
            2
        }
        set(value) {
            p2 = value
        }
    }
}

enum myEnum <: MyInterface<Int64> {
    A
}

main() {
    var enum1: faterInterface<Int64> = myEnum.A
    var enum2: MyInterface<Int64> = myEnum.A
    var enum3: myEnum = myEnum.A

    enum1.b1 = 1
    enum2.b2 = 2

    if (enum1.b1 == 1 && enum2.b2 == 2 && p1 == 1 && p2 == 2) {
        enum3.b1 = 3
        enum3.b2 = 4
        if (enum3.b1 == 1 && enum3.b2 == 2 && p1 == 3 && p2 == 4) {
            return 0
        }
    }
    return 1
}
