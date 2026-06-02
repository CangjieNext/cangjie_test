// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testDCELet01.info
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %cmp_opt %f -o %output 2>&1 | compare testDCELet01.info
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan test

func foo() {
    println("test")
}

main() {
    var a = 0
    {
        =>
        func t<T>() {
            let unused: T
            foo()
        }
        t<Nothing>()
        a
    }()
}