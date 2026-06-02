/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Base {
    protected var value = "baseClass"
}

public open class subclass <: Base {
    public var temp = "temp"
}

public open class subclass1 <: subclass {
    public var value = "subClass1"
}

main(): Int64 {
    var obj: subclass1 = subclass1()
    if (obj.value != "subClass1") {
        return 1
    }

    return 0
}
// ASSERT: scan sema_member_variable_can_not_shadow
