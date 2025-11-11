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
class A {
    public var a: Int32 = 1
    public func test(): Int32 {
        var b = 10
        while (b != 0) {
            b = b - 1
        }
        return 0
    }
}

main(): Int64 {
    //    print("start")
    var b = 10
    while (b != 0) {
        b = b - 1
    }
    //    print("while in func ok")

    var a = A()
    a.test()
    //    print("while in class ok")
    return 0
}
