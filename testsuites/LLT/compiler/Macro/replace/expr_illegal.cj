// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_parallel %diag_json %f -o %output
// ASSERT: scan-8 macro_expect_declaration
// ASSERT: scan the error originates in the macro `callTest` (consider using `--debug-macro` for more info)


import test.*

@callTest(1+2)

@callTest((3.14, "PP"))

@callTest(r's')

@callTest(true)

@callTest("input: Tokens")

@callTest(1<2&&true)

@callTest(v1??0)

@callTest({x:Int32=>x+1})

main(): Int64 {
    return 0
}
