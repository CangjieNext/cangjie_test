/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/a.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %f pkg1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkg1.*

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
