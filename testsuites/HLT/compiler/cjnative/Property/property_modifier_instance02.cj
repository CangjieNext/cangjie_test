/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// open class -> class
class A2 {
    public mut open prop i: Int64 {
        get() {
            return 0
        }
        set(v) {}
    }
}

class B2 <: A2 {
    public mut override prop i: Int64 {
        get() {
            return 1
        }
        set(v) {}
    }
}

// open prop -> prop
open class A3 {
    public mut prop i: Int64 {
        get() {
            return 0
        }
        set(v) {}
    }
}

class B3 <: A3 {
    public mut override prop i: Int64 {
        get() {
            return 1
        }
        set(v) {}
    }
}

// open class -> class ; open prop -> prop
class A4 {
    public mut prop i: Int64 {
        get() {
            return 0
        }
        set(v) {}
    }
}

class B4 <: A4 {
    public mut override prop i: Int64 {
        get() {
            return 1
        }
        set(v) {}
    }
}

main(): Int64 {
    A2();
    B2();
    A3();
    B3();
    A4();
    B4();
    return 0
}
// ASSERT: scan sema_ignore_open
// ASSERT: scan sema_non_inheritable_super_class
// ASSERT: scan sema_cannot_override
