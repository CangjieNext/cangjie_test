// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt -Woff unused %diag_json %n.cj 

struct SA {
    let y = 2
}

struct SC {
    var sa = SA()
}

class CB {
    var sc: SC
    init() {
        sc = SC()
        sc.sa.y = 3
    }
}

main() {
    var cb = CB()
    println(cb.sc.sa.y)
}
// ASSERT: scan sema_cannot_assign_to_immutable
