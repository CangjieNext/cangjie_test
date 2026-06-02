/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class C1 {
    public let x = 1
}

class C2 <: C1 {
    public let x = 2
}

main(): Int64 {
    let obj: C1 = C2()
    let r = obj.x

    if (r != 1) {
        return 1
    }

    return 0
}
// ASSERT: scan sema_member_variable_can_not_shadow
