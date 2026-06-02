// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

func createInt() {
    throw Exception()
    return 0
}

func createString() {
    throw Exception()
    return ""
}

class C {
    var x: Int
    var y: String

    init() {
        try {
            x = createInt()
            y = createString()
        } catch (_) {
        }
    }
}

main(): Unit {
    let c = C()
    println(c.x)
    println(c.y)
}
// ASSERT: scan chir_class_uninitialized_field
