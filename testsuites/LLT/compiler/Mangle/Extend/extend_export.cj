// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test that extend functions must not have file counter (U<number>) and local counter (K<number>) in its mangle name.
// It may cause ABI compatibility issues if these functions have any type of counter in its mangle name.

// EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan _CN7defaultXCNY_1AE8export_fHv

class A {
    public func f() {
        println("Hello")
    }
}

extend A {
    public func export_f() {
        f()
    }
}

main() {
    let a = A()
    a.export_f()
}
