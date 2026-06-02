// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt -Woff unused %diag_json %n.cj 

class CA {
    let b1 = 1
}

struct SA {
    var ca: CA = CA()
}

func foo(x: Int64) {
    let sa = SA()
    sa.ca.b1 = 2
}

main() {
    0
}
// ASSERT: scan sema_cannot_assign_to_immutable
