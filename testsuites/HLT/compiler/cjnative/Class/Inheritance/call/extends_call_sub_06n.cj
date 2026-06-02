/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

open class Base {
    public var one: Int32 = 1
}

class Data <: Base {}

main(): Int64 {
    var res: Int32 = Data.one
    if (res != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_illegal_access_non_static_member
