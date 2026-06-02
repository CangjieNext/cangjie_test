// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %cmp_opt %debugCHIROpt %enableO2 %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC-PIPE-0: %run %output
// ASSERT: regex-not [ArrayLambda] The call to arrayInitByFunction at [*,*] has been optimised to a call to arrayInitByValue.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import std.collection.*

var a = 1

main():Int64 {
    let arr = Array<Int64>(10, { i => a = i; 10 })
    println(a)
    return a - 9
}
