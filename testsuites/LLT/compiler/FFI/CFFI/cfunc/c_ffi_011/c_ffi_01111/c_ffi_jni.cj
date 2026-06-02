// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass\n
// ASSERT: scan-not Exception

foreign func testfunc(cb: CFunc<(Float64, Float64)->Float64>): Float64

var add_f64: CFunc<(Float64, Float64) -> Float64> = {a: Float64, b: Float64 => return a + b }

unsafe main():Int64 {
    if ( testfunc(add_f64) == 3.0 ){
        print("pass\n")
    } else {
        print("fail\n")
    }
    return 0
}
