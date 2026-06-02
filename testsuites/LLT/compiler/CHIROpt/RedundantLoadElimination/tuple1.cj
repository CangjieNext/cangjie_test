// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %disableCodegen %enableChir2RGetOrThrowE -Woff all %f -o %n.%suffix 2>&1 | compare %f

func goo(x: (Int64, Rune)) {
    println(x[1])
}

func foo() {
    var a = (1, r'a')
    println(a[0])
    a = (1, r'b')
    goo(a)
}

main() {
    foo();
    0
}

// ASSERT: scan [RLE] The usages of the result of Load at [15,13] have been replaced by the value at [14,5]
// ASSERT: scan [RLE] The usages of the result of Load at [17,9] have been replaced by the value at [16,5]
