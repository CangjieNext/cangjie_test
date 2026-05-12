/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: %n.c case19.h
// (not Windows) EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%cffi_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan Caught Exception

class A <: Exception {}

class B <: Exception {}

@C
public func C2CJ_Func1(a: Float64): Float64 {
    println("C2CJ_Func " + a.toString())
    throw Exception()
    return a
}

@C
public func C2CJ_Func2(a: Float64): Float64 {
    println("C2CJ_Func " + a.toString())
    var cctest: A = A()
    throw cctest
    return a
}

foreign func C_Func1(a: Float64): Float64

foreign func C_Func2(a: Float64): Float64

main(): Int64 {
    try {
        var bbb: Float64 = unsafe { C_Func1(3.0) }
        println(bbb.toString())
        if (bbb == 11.0) {
            return 0
        }
    } catch (e: Exception) {
        println("Caught Exception")
    }
    try {
        var bbb: Float64 = unsafe { C_Func2(3.0) }
        println(bbb.toString())
        if (bbb == 11.0) {
            return 0
        }
    } catch (a: A) {
        println("Caught Exception")
    }
    return 0
}
