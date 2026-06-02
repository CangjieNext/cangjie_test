/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// var-get-set
open class A {
    public mut open prop i: Int64 {
        get() {
            return 0
        }
        set(v) {}
    }
}

class B <: A {
    public mut override prop i: Int64 {
        get() {
            return 1
        }
        set(v) {}
    }
}

class B5 <: A {
    public mut override prop i: Int64 {
    }
}

main(): Int64 {
    A()
    B()
    return 0
}
// ASSERT: scan sema_property_must_have_accessors
