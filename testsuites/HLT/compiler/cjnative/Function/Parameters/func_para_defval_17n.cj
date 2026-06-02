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
    var res = Foo(1, "x", "xx")
    if (res == "4xxx") {
        return 0
    }
    return 1
}

func Foo(a: Int64, b: String, A!: Int64 = 2, B!: String = "yz"): String {
    return (a + A).toString() + b + B
}
// ASSERT: scan sema_need_named_argument
