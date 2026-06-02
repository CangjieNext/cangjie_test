// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt --fchir-function-inlining %n.cj -o %output | compare %f
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default6<main>Hv, DIRECT CALL:_CN7default4foo1Hv
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default4foo1Hv, DIRECT CALL:_CN7default4foo2Hv
// ASSERT: scan [CallGraphAnalysis] Call Graph found _CN7default4foo2Hv

func foo1() {
    return foo2()
}

func foo2() {
    return 0
}

main(): Int64 {
    foo1()
}
