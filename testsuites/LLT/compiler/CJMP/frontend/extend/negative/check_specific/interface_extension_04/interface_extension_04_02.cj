// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common interface IA {
    common func foo():Unit
}

common extend Int64 <: IA {
    common public func foo():Unit {
        println("common::Int64::foo")
    }
}

common public func int64Foo():Unit {
    var x:Int64 = 100
    x.foo()
}


// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
// ASSERT: scan error: a deriving member must be at least as visible as its base member
package cmp

specific interface IA {}

specific extend Int64 <: IA {
    specific func foo():Unit {
        println("specific::Int64::foo")
    }
}
