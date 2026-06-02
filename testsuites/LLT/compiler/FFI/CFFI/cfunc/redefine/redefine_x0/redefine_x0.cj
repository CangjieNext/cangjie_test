// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c pkg.cj
// EXEC: %clang %clang_shared_opt foo.c -o libfoo.%dylib_suffix
// EXEC: %compiler %compile_lib_opt --verbose pkg.cj -L . -l foo -o pkg.%middle
// EXEC: %compiler %cmp_opt_chir2hlir %verbose_opt %f -L . -l foo pkg.%middle -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan I'm xxx1
// ASSERT: scan bar: 1
// ASSERT: scan I'm foo
internal import a.*

foreign func xxx1(): Unit

@C
func xxx0(a: Int64): Int64 {
    println("I'm xxx0 defined in Cangjie: ${a}")
    a
}

unsafe main() {
    xxx1()
    bar<Int64>(1)
}
