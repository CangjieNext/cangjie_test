// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK: %compiler %disableSemaVic %cmp_opt -Woff unused %diag_json %n.cj

var flag = true
var a = if (flag) {
    var x: Int32
    func foo() {
        x = 3
    }
    foo()
    x
} else {
    Int32(6)
}
let b = if (flag) {
    var x: Int32
    func foo() {
        x = 3
    }
    foo()
    x
} else {
    Int32(6)
}

main() {
    0
}
// ASSERT: scan chir_used_before_initialization
