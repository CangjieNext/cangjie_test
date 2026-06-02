// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt -g %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %f 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan _CN7default3barHCNY_3fooE
// (not CJNATIVE) ASSERT: scan _ZN7default3barEC_ZN7default3fooE

// Test cFunc type mangling

interface foo {
    func print(): Unit
}

class Goo <: foo {
    public func print() {
        println("Goo")
    }
}

func bar(f: foo) {
    Goo().print()
}

main() {
    bar(Goo())
    return 0
}
