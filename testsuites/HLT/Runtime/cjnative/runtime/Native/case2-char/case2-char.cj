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

foreign func PassToCChar(x: Int8): Int8

func PassAndReturnChar(): Int64 {
    var ret = unsafe { PassToCChar(Int8(UInt32(r'a'))) }
    if (ret == Int8(UInt32(r'a'))) {
        print("15")
        return 0
    }
    print("115")
    return 1
}

main(): Int64 {
    return PassAndReturnChar()
}
