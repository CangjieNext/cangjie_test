// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1| compare %f
// (CJNATIVE) ASSERT: scan _CN7default1A3fooHCNY_1BECNY_1CEY3_Y5_

class A {
    func foo(p1: B, p2: C, p3: B, p4: C): Unit {
        throw Exception()
    }
}

class B {}

class C {}

main() {
    var a = A()
    a.foo(B(), C(), B(), C())
}
