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

class Foo {
    public var str = ""
    public init(str: String) {
        this.str = str
    }
}

func run(): Int64 {
    var foo = Foo("Hello Char Lang")
    var res: String = foo.str
    print("StringTest: " + res)
    return 0
}

main(): Int64 {
    return run()
}
