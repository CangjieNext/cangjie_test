/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: %n.c case25.h
// (not Windows) EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%cffi_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan CJ2C_Func1 3.000000
// ASSERT:scan C2CJ_Func1 11.000000
// ASSERT:scan C2CJ_Func2 11.000000
// ASSERT:scan Func 11.000000
// ASSERT:scan get from C2 struct: s ->
// ASSERT:scan get from CJ struct: s ->
// ASSERT:scan get from C1 struct: s ->
// ASSERT:scan Exception

@C
public func C2CJ_Func1(a: Float64): Float64 {
    println("C2CJ_Func1 " + a.toString())
    var b: Float64 = unsafe { C_Func2(a) }
    return b
}

@C
public func C2CJ_Func2(a: Float64): Float64 {
    println("C2CJ_Func2 " + a.toString())
    var b: Float64 = Func(a)
    return b
}

func Func(a: Float64): Float64 {
    println("Func " + a.toString())
    throw Exception()
    return a
}

func CJ2C_Func1(a: Float64): Float64 {
    println("CJ2C_Func1 " + a.toString())
    var b = unsafe { C_Func1(a) }
    return b
}

foreign func C_Func1(a: Float64): Float64

foreign func C_Func2(a: Float64): Float64

main(): Int64 {
    try {
        var bbb: Float64 = CJ2C_Func1(3.0)
        println(bbb.toString())
        if (bbb == 11.0) {
            return 1
        }
    } catch (e: Exception) {
        println(e.toString())
    }
    return 0
}
