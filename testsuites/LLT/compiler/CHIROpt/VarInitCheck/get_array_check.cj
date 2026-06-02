// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

public struct Foo {
    public let data: VArray<UInt64, $100>
    public init() {
        throw Exception("trap")
    }
    public func m1() {
        println("m1")
    }
}

main(): Int64 {
    var f: Foo
    try {
        f = Foo()
    } catch (e: Exception) {
    }
    f.data[0]
    return 0
}
// ASSERT: scan chir_used_before_initialization
