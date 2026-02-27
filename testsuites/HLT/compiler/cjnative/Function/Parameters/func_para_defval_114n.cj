/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo(1, "x", 3)
    if (res == "4xyz") {
        return 0
    }
    return 1
}

var x: Int64 = 2
let y: String = "yz"

func Foo(a: Int64, b: String, A!: Int64 = x, A!: String = y): String {
    return (a + A).toString() + b + B
}
// ASSERT: scan sema_need_named_argument
// ASSERT: scan sema_redefinition
// ASSERT: scan sema_undeclared_identifier
