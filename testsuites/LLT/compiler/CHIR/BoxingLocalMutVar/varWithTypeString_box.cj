// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 456

var a = true

func foo() {
    var str = "123"

    func goo(): Unit {
        if (a) {
            str = "456"
        } else {
            println("fake recursion")
            goo()
        }
    }
    goo()

    print(str)
}

main() {
    foo()
    0
}