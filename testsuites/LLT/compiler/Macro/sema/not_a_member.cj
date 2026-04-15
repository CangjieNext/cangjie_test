// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_property_must_have_accessors
// ASSERT: scan-1 sema_not_member_of
// ASSERT: scan-1 sema_cannot_assign_to_immutable
// ASSERT: scan the error originates in the macro `M1` (consider using `--debug-macro` for more info)

import define.*

@M1
class Base12 {
    public var du: Int64 = 1
    public prop a: Int64 {
    }
    public func f(): Int64 {
        a = 2
        return 0
    }
}

@M1
main() {
    var x = Base12()
    if (x.a == 4) {
        return 0
    }
    return 1
}
