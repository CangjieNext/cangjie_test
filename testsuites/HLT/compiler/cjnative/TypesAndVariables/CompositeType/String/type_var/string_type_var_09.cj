/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: Hello Char Lang

interface I {
    static func bar() {
        let str = "Hello Char Lang"
        return str
    }
}

class Test <: I {}

func run(): Int64 {
    var res: String = Test.bar()
    print("StringTest: " + res)
    return 0
}

main(): Int64 {
    return run()
}
