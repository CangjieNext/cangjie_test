/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_macro %f

import std.ast.*

extend Tokens <: ToString {
    public func toString(): String {
        return match (this[0]) {
            case Some(t) => t.value
            case _ => "None"
        }
    }
}

main() {
    var a: String = "${quote(1)}"
    print("result is " + a)
    return 0
}
// ASSERT: scan sema_extend_duplicate_interface
// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_pattern_not_match
// ASSERT: scan sema_undeclared_identifier
