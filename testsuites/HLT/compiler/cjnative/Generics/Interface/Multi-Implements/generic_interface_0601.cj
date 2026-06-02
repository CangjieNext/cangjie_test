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

interface A1<T> {
    func foo(): Int64 {
        return 1
    }
}

interface A2<T> {
    func foo(): Int64 {
        return 2
    }
}

class B<T> <: A1<T> & A2<T> {
    public prop m: Int64 {
        get() {
            return foo()
        }
    }
}
// ASSERT: scan sema_interface_member_must_be_implemented
