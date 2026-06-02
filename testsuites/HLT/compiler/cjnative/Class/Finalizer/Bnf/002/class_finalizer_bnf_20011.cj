/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE:  macro_define.cj
// EXEC: %compiler %cmp_macro macro_define.cj
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.runtime.*
import test.*

var flag = 0

@M[1]
class A {
    ~init() {
        flag += 1
    }
}

func test() {
    var a = A()
}

main() {
    test()
    GC()
    print("flag is ${flag}.\n")
    return 0
}
