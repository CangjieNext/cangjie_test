/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  ../../asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt asan.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*
import std.time.*
import asan.*

class A {
    var a = 0
}

let x = A()

func f(): Unit {
    Timer.repeat(Duration.second, Duration.second, f)
    x.a++
    println(x.a)
}

main(): Int64 {
    Timer.repeat(Duration.second, Duration.second, f)
    sleep(Duration.second * 2)
    asanGC()
    return 0
}
