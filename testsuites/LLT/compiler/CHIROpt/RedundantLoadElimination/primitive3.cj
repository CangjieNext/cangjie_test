// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %disableCodegen %enableO2 -Woff all %f -o %n.%suffix 2>&1 | compare %f

func goo(x: Int64) {
    x + x
}

var gv1 = 1;
var gv2 = 2;

func foo(cond: Bool) {
    var x = gv1
    while (cond) {
        goo(x)
        x = gv2
        println(x)
    }
}

main() {
    foo(true);
    0
}

// ASSERT: scan [RLE] The usages of the result of Load at [21,17] have been replaced by the value at [20,9]
// ASSERT: regex-not \[RLE\] The usages of the result of Load at \[19,.*\] have been replaced by the value at .*
