/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: %n.c
// (not Windows) EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%cffi_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 15

foreign func PassToCInt32(x: Int32): Int32

foreign func PassToCInt32_7(a: Int32, b: Int32, c: Int32, d: Int32, e: Int32, f: Int32, g: Int32): Int32

func PassAndReturnInt32(): Int64 {
    var ret = unsafe { PassToCInt32(3) }
    var ret1 = unsafe { PassToCInt32_7(1, 2, 3, 4, 5, 6, 7) }
    if (ret == 3) {
        if (ret1 == 100) {
            println("15")
            return 0
        }
        println("10")
    }
    println("20")
    return 1
}

main(): Int64 {
    return PassAndReturnInt32()
}
