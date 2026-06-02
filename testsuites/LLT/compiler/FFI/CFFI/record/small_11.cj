// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %n.cj %cffi-link -o %n.%suffix
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %n.%suffix 2>&1 | compare %f
// EXEC: %compiler %cmp_opt %enableO2 %n.cj %cffi-link -o %n.%suffix
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan 3
// ASSERT: scan 13

@C
struct CStruct {
    let f: CFunc<(Int64, Int64) -> Int64> = { a: Int64, b: Int64 =>
        return a + b
    }
}

foreign func foo(cs: CStruct): CStruct

unsafe main() {
    var cs = CStruct()
    var cs1 = foo(cs)
    var n = cs1.f(1, 2)
    println(n)
}
