// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test that extend private functions must have file counter (U<number>) and local counter (K<number>) in its mangle name.
// It may cause duplicate identifier errors if these private functions cannot be distinguished by its mangle name.

// EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan _CN7defaultXCNY_1AEU00000001L5uuIK_10internal_fHv
// (CJNATIVE) ASSERT: scan _CN7defaultXCNY_1AEU00000001L5uuIK0_10internal_fHv

class A {
    public func f() {
        println("Hello")
    }
}

extend A {
    private func internal_f() {
        println("First f")
        f()
    }

    public func f1() {
        internal_f()
    }
}

extend A {
    private func internal_f() {
        println("Second f")
        f()
    }

    public func f2() {
        internal_f()
    }
}

main() {
    let a = A()
    a.f1()
    a.f2()
}
