// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

struct SA {
    var y = 2
}

class CA {
    var sa = SA()
}

class CB {
    var ca: CA
    init() {
        ca.sa.y = 3
        ca = CA()
    }
}

main() {
    var cb = CB()
    println(cb.ca.sa.y)
}
// ASSERT: scan chir_used_before_initialization
