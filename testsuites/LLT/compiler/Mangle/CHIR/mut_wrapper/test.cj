// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) LEVEL: 0
// (CJNATIVE and DEBUG_OPTION) EXEC: %frontendCompiler --dump-ir %f 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define void @"_CMN7default1I3fooHv$N7default1SE$CN7default1IE"

interface I {
    mut func foo() {
        goo()
    }
    mut func goo() {}
}

struct S <: I {
    var a = 1
    public mut func goo() {
        a = 2
    }
    public func goo2() {
        println(a)
    }
}

main() {
    var x: S = S()
    x.foo()
    x.goo2() // 这里应该打印2
}
