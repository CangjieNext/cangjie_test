// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableO2 %dumpCHIRDebug %disableCodegen  -Woff all %f -o %n.%suffix 2>&1 | compare %f

struct S {
    var x: Int64 = 1
    mut func foo() {
        x = 2
    }
    func goo() {
        x
    }
}

main() {
    var x: Int32 = 1
    println(x)
    var y = x + x
    var s = S()
    s.foo()
    println(x)
    var z: Float32 = 2.3
    var a = z + z
    var b: VArray<Int64, $3> = [1, 2, 3]
    var d: Bool = a > 0.0
}

// ASSERT: scan [DCE] The Constant expression at [0,0] has been deleted
// ASSERT: scan [DCE] The Constant expression at [0,0] has been deleted
// ASSERT: scan [DCE] The Constant expression at [23,13] has been deleted
// ASSERT: scan [DCE] The Constant expression at [23,17] has been deleted
// ASSERT: scan [DCE] The Constant expression at [28,13] has been deleted
// ASSERT: scan [DCE] The Constant expression at [28,17] has been deleted
