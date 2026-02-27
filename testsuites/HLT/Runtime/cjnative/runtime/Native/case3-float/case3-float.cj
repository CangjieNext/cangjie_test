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

foreign func PassToCFloat32_1(x: Float32): Float32

foreign func PassToCFloat32_3(a: Float32, b: Float32, c: Float32): Float32

foreign func PassToCFloat32_7(a: Float32, b: Float32, c: Float32, d: Float32, e: Float32, f: Float32, g: Float32): Float32

func PassAndReturnFloat32(): Int64 {
    var ret = unsafe { PassToCFloat32_1(3.0) }
    var ret1 = unsafe { PassToCFloat32_7(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0) }
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
    return PassAndReturnFloat32()
}
