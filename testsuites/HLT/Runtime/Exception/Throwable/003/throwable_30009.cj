/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not O2) EXEC: %compiler %cmp_opt %f -o %output
// (not O2) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (not O2) ASSERT: regex lambda.2|lambda.3
// (not O2) ASSERT: scan throwable_30009.cj:20

package test

func foo() {
    var test = {
        =>
        var foo = {=> throw Exception("lambda.2")};
        foo();
        1
    }()
}

main() {
    foo()
    return 5
}
