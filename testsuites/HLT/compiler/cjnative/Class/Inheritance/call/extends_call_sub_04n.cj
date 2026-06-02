/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    public static var one: Int32 = 1
}

class Data <: Base {}

main(): Int64 {
    var obj = Data()
    var res: Int32 = obj.one
    if (res != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_object_cannot_access_static_member
