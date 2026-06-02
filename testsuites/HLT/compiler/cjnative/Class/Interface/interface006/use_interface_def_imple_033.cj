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
    mut prop b: Int64
    mut prop b1: Int64 {
        get() {
            b
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

struct myStruct {
    var x = 20
}

extend myStruct <: MyInterface<Int64> {
    public mut prop b: Int64 {
        get() {
            1
        }
        set(value) {
            x = value
        }
    }
}

main() {
    var struct1: faterInterface<Int64> = myStruct()
    var struct2: MyInterface<Int64> = myStruct()
    var struct3: myStruct = myStruct()

    struct1.b1 = 1
    struct2.b2 = 2
    struct3.b = 1
    print(struct1.b1.toString())
    print(struct3.x.toString())
    if (struct1.b1 == 1 && struct2.b2 == 2 && p1 == 1 && p2 == 2) {
        struct3.b1 = 3
        struct3.b2 = 4
        if (struct3.b1 == 1 && struct3.b2 == 2 && p1 == 3 && p2 == 4 && struct3.x == 1) {
            return 0
        }
    }
    return 1
}
