/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public let a: Int32 = 2
    public func f(x: Test): Int32 {
        return x.a
    }
}

func run(): Int64 {
    var test: Test = Test()
    var res: Int32 = test.f(test)
    if (res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
