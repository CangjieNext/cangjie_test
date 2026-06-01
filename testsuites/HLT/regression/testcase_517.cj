/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./c_def.c
// EXEC: %clang %clang_opt ./c_def.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

foreign func C_Abort(): Unit

main(): Int64 {
    var foo: Int32 = 0

    func bar(): Int32 {
        var baz: Int32 = 0
        if (foo != 45) {
            baz = foo
            if (foo != 45) {
                baz = foo
            }
            return baz
        }

        foo = 1
        if (!(bar() != 0)) {
        }
        return baz
    }

    foo = 1
    if (!(bar() != 1)) {
        unsafe { C_Abort() }
    }
    print(0)
    return 0
}
