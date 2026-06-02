// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %f %cffi-link -o %output
// EXEC-PIPE-1: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ?
// ASSERT: scan An exception has occurred:
// ASSERT: scan Exception: In CFunc

foreign func CallCFunc(cb: CFunc<() -> Unit>): Unit

@C
func foo(): Unit {
    println("?")
    throw Exception("In CFunc")
}

unsafe main() {
    CallCFunc(foo)
    CallCFunc(foo)
    0
}
