/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./../../../../API/asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt %f asan.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan None

import asan.*

class A <: Exception {}

func test(): Unit {
    throw A()
}

main() {
    var a: Future<Unit> = spawn {test()}
    sleep(Duration.millisecond * 10)

    try {
        let res = a.get()
        print("get something\n")
    } catch (e: Exception) {
        print("None\n")
    }
    asanGC()
    return 0
}
