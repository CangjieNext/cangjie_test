// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class AAA {
    var a = 999
}

class BBB <: AAA {
    var b = 888
}

class DDD {
    var d = Option<(AAA) -> BBB>.None
    var w: Int64 = 888

    init(para: (AAA) -> BBB) {
        d = para
    }
}

struct CCC {
    var c = Option<() -> Int64>.None
    var e: Int64 = 999

    init(para: () -> Int64) {
        c = para
    }
}

func foo() {
    return 1
}

main() {
    let f1 = {a: AAA => BBB()}
    var z = DDD(f1)
    var x = CCC(foo)
    0
}
