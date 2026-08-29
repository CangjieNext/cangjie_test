// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// The public std.ref.WeakRef constructors are normal-mode-only today. This
// negative test records that CJ_MCC_NewLocalWeakRefObject is not reachable
// from Cangjie source until WeakRef gains a local initializer/API surface.
// EXEC-PIPE-1: %compiler %diag_json %f 2>&1 | compare %f

import std.ref.*

class WeakTarget {
    let value: Int64

    init(value: Int64) {
        this.value = value
    }
}

main(): Unit {
    let target = WeakTarget(52)
    let weak: WeakRef<WeakTarget> @local? = WeakRef<WeakTarget>(target, CleanupPolicy.EAGER) @local?
}
// ASSERT: scan-1 "DiagKind": "sema_no_match_constructor",
// ASSERT: scan "Errors": 1,
