// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1| compare %f
// (CJNATIVE) ASSERT: scan _CN7default3fooHCNY_1AECNY_1BEY2_Y4_EY1_HY2_Y4_Y2_Y4_

class A {}

class B {}

func foo(p1: A, p2: B, p3: A, p4: B): Unit {
    func foo(p1: A, p2: B, p3: A, p4: B): Unit {
        throw Exception()
    }
    foo(p1, p2, p3, p4)
}

main() {
    foo(A(), B(), A(), B())
}
