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

foreign func PassToCFloat64_1(x: Float64): Float64

foreign func PassToCFloat64_3(a: Float64, b: Float64, c: Float64): Float64

foreign func PassToCFloat64_7(a: Float64, b: Float64, c: Float64, d: Float64, e: Float64, f: Float64, g: Float64): Float64

func PassAndReturnFloat64(): Int64 {
    var ret = unsafe { PassToCFloat64_1(3.0) }
    var ret1 = unsafe { PassToCFloat64_7(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0) }
    if (ret == 3.0) {
        if (ret1 == 100.0) {
            print("15")
            return 0
        }
        print("115")
        return 0
    }
    print("1110")
    return 1
}

main(): Int64 {
    return PassAndReturnFloat64()
}
