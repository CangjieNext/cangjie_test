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
var gv2 = 3;
var gv3 = 4;

func foo(cond: Bool) {
    var x = gv1
    if (cond) {
        println(x)
    } else {
        goo(x)
        x = gv2
    }
    println(x)
    x = gv3
    var b = x
}

main() {
    foo(true);
    0
}

// ASSERT: scan [RLE] The usages of the result of Load at [20,17] have been replaced by the value at [18,5]
// ASSERT: scan [RLE] The usages of the result of Load at [22,13] have been replaced by the value at [18,5]
// ASSERT: regex-not \[RLE\] The usages of the result of Load at \[25,.*\] have been replaced by the value at .*
// ASSERT: scan [RLE] The usages of the result of Load at [27,13] have been replaced by the value at [26,5]
