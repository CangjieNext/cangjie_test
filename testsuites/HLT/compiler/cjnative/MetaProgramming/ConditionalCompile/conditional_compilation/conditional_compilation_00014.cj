/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (not g)ASSERT: scan this is not debug
// (g) ASSERT: scan this is debug

class A {
    @When[!debug]
    var a = "this is not debug"

    @When[debug]
    var a = "this is debug"

    func test() {
        print(a)
    }
}

main() {
    var a = A()
    a.test()
    return 0
}
