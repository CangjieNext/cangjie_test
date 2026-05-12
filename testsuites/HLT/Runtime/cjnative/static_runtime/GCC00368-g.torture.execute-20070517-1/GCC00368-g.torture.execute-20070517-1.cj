/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: %n.c
// (not Windows and not MAC) EXEC: %clang %clang_opt %n.c -o lib%n.c.cfile.%cffi_suffix
// (not Windows and not MAC) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping --static -o %output
// (not Windows and not MAC) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 0

foreign func C_Abort(): Unit

func get_kind(v: Int32): Int32 {
    var k: Int32 = v
    return k
}

func some_call(): Int32 {
    return 0
}

func example(arg: Int32): Unit {
    var tmp: Int32
    var kind: Int32 = get_kind(arg)
    if (kind == 9 || kind == 10 || kind == 5) {
        if (some_call() == 0) {
            if (kind == 9 || kind == 10) {
                tmp = arg
            } else {
                unsafe { C_Abort() }
            }
        }
    }
}

main(): Int64 {
    example(10)
    print(0)
    return 0
}
