// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class AAA {
    var a = 999
}

class BBB <: AAA {
    var b = 888
}

class DDD {
    var d = Option<(AAA) -> BBB>.None
}

struct CCC {
    var c = Option<(AAA) -> BBB>.None
    var e: Int64 = 999

    init(para: (AAA) -> BBB) {
        c = para
    }
}

func foo() {
    return 1
}

main() {
    let f1 = {a: AAA => BBB()}
    var z = CCC(f1)
    var x = DDD()
    var y = foo
    0
}
