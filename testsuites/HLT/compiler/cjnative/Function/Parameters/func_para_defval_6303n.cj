/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Foo
    var res2 = res1()
    // print(res2.toString()+"n")
    if (res2 == 4) {
        return 0
    }
    return 1
}

var x: Int64 = 2

func Foo(a!: Int64 = x): Int64 {
    return a * 2
}
// ASSERT: scan sema_wrong_number_of_arguments
