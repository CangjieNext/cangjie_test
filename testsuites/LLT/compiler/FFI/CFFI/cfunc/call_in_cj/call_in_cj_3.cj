// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not abort (core dumped)

var f1: CFunc<() -> Unit> = { =>
    throw Exception("xx")
}

func ff() {
    unsafe { f1() }
}

var foo: CFunc<() -> Unit> = { =>
    ff()
}

main() {
    unsafe { foo() }
}

/* SCAN-IN
An exception has occurred:
Exception: xx
*/
