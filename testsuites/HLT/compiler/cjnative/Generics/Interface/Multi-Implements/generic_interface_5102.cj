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
    if (B3<String>().m != 1) {
        return 1
    }
    if (B4<String>().m != 1) {
        return 1
    }
    return 0
}

interface I<T> {
    func foo(): Int64 {
        return 1
    }
}

class B3<T> {}

extend<T> B3<T> <: I<T> & I<T> {
    public prop m: Int64 {
        get() {
            return foo()
        }
    }
}

class B4<String> {}

extend<String> B4<String> <: I<String> & I<String> {
    public prop m: Int64 {
        get() {
            return foo()
        }
    }
}
// ASSERT: scan sema_inherit_duplicate_interface
// ASSERT: scan sema_extend_duplicate_interface
