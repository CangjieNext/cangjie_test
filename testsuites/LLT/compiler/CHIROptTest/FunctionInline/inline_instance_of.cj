// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler --fchir-function-inlining -Woff all %f -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan (A3, A3) is (A2, A3)

open class A1 {}

open class A2 <: A1 {}

open class A3 <: A2 {}

func assert<T, T2>(input: T): Bool {
    return input is T2
}

main() {
    var tuple2 = (A3(), A3())
    var temp = assert<(A2, A2), (A2, A3)>(tuple2)
    if (temp) {
        println("(A3, A3) is (A2, A3)")
    } else {
        println("(A3, A3) is not (A2, A3)")
    }
    return 0
}