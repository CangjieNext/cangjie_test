// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default6<main>Hv, DIRECT CALL:_CPI7default4foo1HiE1aHv, DIRECT CALL:_CN7default4foo1Hi
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default4foo1Hi, DIRECT CALL:_CPI7default4foo1HiE1aHv, DIRECT CALL:_CN7default4foo1Hi, DIRECT CALL:Unknown Function, DIRECT CALL:Unknown Function, DIRECT CALL:Unknown Function, DIRECT CALL:Unknown Function
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CPI7default4foo1HiE1aHv

func foo1(a!: Int32 = 1): Int32 {
    func foo2(b!: Int32 = 2): Int32 {
        func foo3(c!: Int32 = 3): Int32 {
            foo1()
            return 2
        }
        foo3()
        return 3
    }
    foo2()
    return 4
}

main(): Int32 {
    foo1()
}
