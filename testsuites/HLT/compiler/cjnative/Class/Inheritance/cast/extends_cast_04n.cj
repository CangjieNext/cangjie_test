/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1| compare %f

open class Base {}

class Data <: Base {
    static func foo(parm1: Int32): Int32 {
        return 3
    }
}

main(): Int64 {
    var obj: Data = Data(Base())
    var res: Int32 = obj.foo()
    return 0
}
// ASSERT: scan sema_wrong_number_of_arguments
// ASSERT: scan sema_object_cannot_access_static_member
