/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: %n.c case11.h
// (not Windows) EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%cffi_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
/* SCAN-IN
C_Func:1
C_Func:2
C_Func:3
C_Func:4
C_Func:5
C_Func:6
C_Func:7
C_Func:8
C_Func:9
C_Func:10
10
C_Func:30
30
 */

@C
public func C2CJ_Func(a1: Int32, a2: Int64, a3: Int32, a4: Int64, a5: Int32, a6: Int64, a7: Int32, a8: Int64, a9: Int32,
    a10: Int64): Int64 {
    print(a10.toString() + "\n")
    return a2 + a4 + a6 + a8 + a10
}

foreign func C_Func(a1: Int32, a2: Int64, a3: Int32, a4: Int64, a5: Int32, a6: Int64, a7: Int32, a8: Int64, a9: Int32,
    a10: Int64): Int64

main(): Int64 {
    var ret = unsafe { C_Func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) }
    print(ret.toString() + "\n")
    return 0
}
