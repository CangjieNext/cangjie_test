// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: %n.c
// (Darwin) EXEC: %clang %clang_shared_opt -Wl,-undefined,suppress,-flat_namespace %n.c -o %cffi_output
// (Linux) EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// (Unix) EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output

// The C code is special. The code contains a function with only a function signature but no function body. 
// In this case, the linker in Windows cannot find the incomplete symbol. Therefore, the linker in Windows
// cannot be compiled into a dynamic library but can be compiled into a static library.
// (Windows) EXEC: %clang -c %n.c -o lib%n.a
// (Windows) EXEC: %compiler %cmp_opt_chir2hlir %verbose_opt %f -L . -l%n -o %output

// EXEC-PIPE-1: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Caught Exception

@C
public func C2CJ_Func(a: Float64): Float64 {
    print("C2CJ_Func " + a.toString() + "\n")
    throw Exception()
    return a
}

foreign func C_Func(a: Float64): Float64

main(): Int64 {
    try {
        var bbb: Float64 = unsafe { C_Func(3.0) }
        print(bbb.toString() + "\n")
        if (bbb == 11.0) {
            return 0
        }
    } catch (e: Exception) {
        print("Caught Exception\n")
    }
    return 1
}
