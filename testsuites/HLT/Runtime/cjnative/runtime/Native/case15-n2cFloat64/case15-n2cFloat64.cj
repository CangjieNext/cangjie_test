/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: %n.c case15.h
// (not Windows) EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%cffi_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
/* SCAN-IN
C2CJ_Func 11.000000
get from CJ struct: s -> 11.000000
get from CJ struct: s -> 28.000000
11.000000
 */

@C
public func C2CJ_Func(a: Float64): Float64 {
    print("C2CJ_Func " + a.toString() + "\n")
    return a
}

@C
public func C2CJ_Func_7(a: Float64, b: Float64, c: Float64, d: Float64, e: Float64, f: Float64, g: Float64): Float64 {
    return a + b + c + d + e + f + g;
}

foreign func C_Func(a: Float64): Float64

foreign func C_Func_7(a: Float64, b: Float64, c: Float64, d: Float64, e: Float64, f: Float64, g: Float64): Float64

main(): Int64 {
    var bbb: Float64 = unsafe { C_Func(3.0) }
    var ccc: Float64 = unsafe { C_Func_7(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0) }
    print(bbb.toString() + "\n")
    if (bbb == 11.0 && ccc == 28.0) {
        return 0
    }
    return 1
}
