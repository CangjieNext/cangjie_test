// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-auto llvm.module.flags
// ASSERT: regex-auto DILocalVariable(name: "a"
// ASSERT: regex-auto DISubprogram(name: "bar", linkageName:

func foo(a: Int32) {
    var a1 = a + 2
    let b = a1 * a
    a1 = b - 3
    return bar(a1)
}

func bar(b: Int32) {
    var a = b - 2
    let c: Int32 = 12
    return a + c
}

main(): Int64 {
    let a0: Int32 = 123

    let b0: Int32 = 4

    var c0 = foo(a0 + b0)

    return 0
}
