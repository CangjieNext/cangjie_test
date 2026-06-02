// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1| compare %f
// (CJNATIVE) ASSERT: scan _CN7default3fooIG_G0_HG_CNY_1AEG0_CNY_1BEG_Y4_G0_Y6_

class A {}

class B {}

func foo<T, K>(p1: T, p2: A, p3: K, p4: B, p5: T, p6: A, p7: K, p8: B): Unit {
    throw Exception()
}

main() {
    foo(A(), A(), B(), B(), A(), A(), B(), B())
}
