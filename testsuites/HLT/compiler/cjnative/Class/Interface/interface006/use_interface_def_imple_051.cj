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

interface faterInterface {
    func foo1(): Int64
    prop b: Int64 {
        get() {
            foo1()
        }
    }
}

interface MyInterface <: faterInterface {}

class myStruct<T> {}

extend<T> myStruct<T> <: MyInterface {
    public func foo1(): Int64 {
        1
    }
}

main() {
    var c1: faterInterface = myStruct<faterInterface>()
    var c2: MyInterface = myStruct<faterInterface>()
    var c3: myStruct<faterInterface> = myStruct<faterInterface>()

    if (c1.b == 1 && c2.b == 1 && c3.b == 1) {
        return 0
    } else {
        return 1
    }
}
