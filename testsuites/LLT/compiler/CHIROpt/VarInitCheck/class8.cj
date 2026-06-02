// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK: %compiler %disableSemaVic %cmp_opt -Woff unused %diag_json %n.cj

class CA {
    public var a: Int32
    public init() {
        if (true) {
            a = 1
        } else {
            var x = 0
        }
    }
}

main() {
    0
}
// ASSERT: scan chir_class_uninitialized_field
