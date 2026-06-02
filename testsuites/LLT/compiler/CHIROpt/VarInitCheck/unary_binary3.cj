// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

public func foo1() {
    var a: Int32
    if (false && if (true) {
        a = 1
        true
    } else {
        a = 1
        true
    }) {
        println(a)
    }
    if (true || if (true) {
        a = 1
        true
    } else {
        a = 1
        true
    }) {
        println(a)
    }
}

public func foo2() {
    var a: Int32
    if (try {
        throw Exception();
        true
    } finally {} && if (true) {
        a = 1
        true
    } else {
        a = 1
        true
    }) {
        println(a)
    }
    println(a)
}

main(): Int32 {
    return 0
}
// ASSERT: scan-2 chir_used_before_initialization
