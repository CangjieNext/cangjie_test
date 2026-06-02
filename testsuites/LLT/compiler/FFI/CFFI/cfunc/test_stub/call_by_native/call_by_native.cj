// DEPENDENCE: %n.c
// (Darwin) EXEC: %clang %clang_shared_opt -Wl,-undefined,suppress,-flat_namespace %n.c -o %cffi_output
// (not Darwin) EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %f %cffi-link -o %output
// EXEC-PIPE-1: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception: xxx
// ASSERT: regex call_by_native.cj:17

foreign func call(f: CFunc<() -> Unit>): Unit

var foo: CFunc<() -> Unit> = {
    =>
    throw Exception("xxx")
}

unsafe main() {
    call(foo)
    0
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
