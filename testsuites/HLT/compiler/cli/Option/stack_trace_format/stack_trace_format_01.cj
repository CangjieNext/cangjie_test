/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (CJNATIVE and not O2) EXEC: %compiler %cmp_opt --stack-trace-format=default %f -o %output
// (CJNATIVE and not O2) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan StackOverflowError
// ASSERT: scan at default.A<...>::init()
// ASSERT: scan at default.B<...>::init()
// ASSERT: scan at default.B<...>::test()

class A<T> {
    init() {
        B<Int64>.test()
    }
}

class B<T> {
    init() {
        var a = A<Int64>()
    }

    static func test() {
        var b = B<Int64>()
    }
}

main() {
    var a = A<Int64>()
    return 0
}
