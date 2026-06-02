// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 11

func foo() {
    var x = 1
    func goo(): Int64 {
        println("goo")
        x++
        func hoo(): Int64 {
            println("hoo")
            x++
            if (x > 10) {
                return 0
            }
            goo()
        }
        hoo()
    }
    goo()
    println(x)
    0
}

main() { 
    foo() 
}