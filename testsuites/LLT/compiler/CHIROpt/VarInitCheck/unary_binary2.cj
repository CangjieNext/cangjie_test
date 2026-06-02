// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

public func foo() {
    var a: Bool
    let b: Bool
    var c = a && b
    var d = a || b
    var e: Bool = true
    var f = e || a
    println("${b}")
    println("output : ${a}")
}

main(): Int32 {
    var a: Int32
    var b = !a
    var c = b << a
    var d = c & a
    var e = b | a
    var f = c ^ a
    var g: Int32
    var h = b ^ a | g << a
    return 0
}
// ASSERT: scan-15 chir_used_before_initialization
