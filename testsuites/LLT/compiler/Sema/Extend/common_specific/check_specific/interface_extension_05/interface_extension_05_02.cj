// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

interface IA {
    func foo():Unit
}

common extend Int64 <: IA {
    public func foo():Unit {
        println("_::Int64::foo")
    }
}

common public func int64Foo():Unit {
    var x:Int64 = 100
    x.foo()
}


// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
// ASSERT: scan error: function 'foo' has overload conflicts
// ASSERT: scan error: 'platform' function 'foo' can not find 'common' match
package cmp

platform extend Int64 <: IA {
    platform public func foo():Unit {
        println("platform::Int64::foo")
    }
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

