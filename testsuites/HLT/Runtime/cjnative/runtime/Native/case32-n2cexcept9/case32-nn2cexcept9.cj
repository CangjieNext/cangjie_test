/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: %n.c
// EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%cffi_suffix
// EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping -o %output
// (!target_win) RUN-EXEC-PIPE-134: %run %run_opt %output %run_args 2>&1 | compare %f
// (target_win) RUN-EXEC-PIPE-3: %run %run_opt %output %run_args 2>&1 | compare %f
// (target_win) ASSERT: scan ThrowException fail, abort.
// (target_mac) ASSERT: scan Two pending exceptions are thrown when a C function calls Cangjie function. Program will abort.
// (!target_win & (target_win | target_mac | target_linux)) ASSERT: scan CJNative Handle signal: 6
// (!target_win & target_android) ASSERT: scan Aborted
// (!target_win & target_ohos) ASSERT: scan Signal 6 (core dumped)
// (!target_win & (target_ios | target_ios_simulator)) ASSERT: scan 

@C
public func C2CJ_Func(a: Float64): Float64 {
    println("C2CJ_Func " + a.toString())
    throw Exception()
    return a
}

func CJ2C_Func(a: Float64): Float64 {
    println("CJ2C_Func " + a.toString())
    var b = unsafe { C_Func(a) }
    return b
}

foreign func C_Func(a: Float64): Float64

main(): Int64 {
    try {
        var bbb: Float64 = CJ2C_Func(3.0)
        println(bbb.toString())
        if (bbb == 11.0) {
            return 1
        }
    } catch (e: Exception) {
        println(e.toString())
    }
    return 0
}
