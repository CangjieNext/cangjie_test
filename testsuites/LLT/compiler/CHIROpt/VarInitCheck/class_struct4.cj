// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

class CA {
    var y = 2
}

struct SC {
    var ca = CA()
}

class CB {
    var sc: SC
    init() {
        sc.ca.y = 3
        sc = SC()
    }
}

main() {
    var cb = CB()
    println(cb.sc.ca.y)
}
// ASSERT: scan chir_used_before_initialization
