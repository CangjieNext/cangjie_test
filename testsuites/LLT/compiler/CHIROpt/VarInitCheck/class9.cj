// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK: %compiler %disableSemaVic %cmp_opt -Woff unused %diag_json %n.cj

class CA {
    var a: Int32
    let b: Int32
    init() {
        a = 3
    }
    init(input: Int32) {
        this()
        a = input
    }
}

main() {
    0
}
// ASSERT: scan chir_class_uninitialized_field
