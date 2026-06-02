// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: pkg.cj
// EXEC: %compiler %compile_lib_opt --verbose pkg.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt_chir2hlir %verbose_opt %f pkg.%middle -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan I'm foo defined in package default: 1
// ASSERT: scan bar: 1
// ASSERT: scan I'm foo
import a.*

@C
private func foo(a: Int64): Int64 {
    println("I'm foo defined in package default: ${a}")
    a
}

unsafe main() {
    foo(1)
    bar<Int64>(1)
}
