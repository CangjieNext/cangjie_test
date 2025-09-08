// EXEC-1: %compiler %incrementalCompile %cmp_opt -o %output %f 2>&1 | compare %f
func foo(): (Int64) -> () {
    { _ => () }
}
main(): Unit {}


// ASSERT: scan error: expected '->' in function type
// ASSERT: scan  ==> ParenAsType.cj:1:27:
// ASSERT: scan   | 
// ASSERT: scan 1 | func foo(): (Int64) -> () {
// ASSERT: scan 1 error generated, 1 error printed.
// ASSERT: scan-not core dumped

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
