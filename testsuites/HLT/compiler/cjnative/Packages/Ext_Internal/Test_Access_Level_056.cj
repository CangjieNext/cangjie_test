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
    protected var value = "subClass"
    public func getValue(): String {
        return value
    }
}

main(): Int64 {
    var obj: subclass = subclass()

    if (obj.getValue() != "subClass") {
        return 1
    }

    return 0
}
// ASSERT: scan sema_member_variable_can_not_shadow
