/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    if (B<String>().m != 1) {
        return 1
    }
    return 0
}

interface I<T> {
    func foo(): Int64 {
        return 1
    }
}

interface J1<T> <: I<T> & I<T> {
    prop m: Int64 {
        get() {
            return foo()
        }
    }
}

interface J2<T> <: I<String> & I<String> {
    prop m: Int64 {
        get() {
            return foo()
        }
    }
}

class B<T> <: J1<T> & J2<T> {}
// ASSERT: scan sema_inherit_duplicate_interface
