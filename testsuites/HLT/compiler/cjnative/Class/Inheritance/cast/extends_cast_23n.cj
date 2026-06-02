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
    var obj1: Base = Data()
    var res1: Int32 = obj1.foo()
    return 0
}

open class Base {
    static func foo(parm1: Int32): Int32 {
        return 3
    }
}

class Data <: Base {}
// ASSERT: scan sema_object_cannot_access_static_member
