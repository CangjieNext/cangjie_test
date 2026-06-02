// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %disableCodegen %enableO2 -Woff all %f -o %n.%suffix 2>&1 | compare %f

var gv1 = 1;
var gv2 = 2

func foo() {
    var x = gv1
    println(x)
    var a = x + x
    x = gv2
    var b = x
}

main() {
    foo();
    0
}

// ASSERT: scan [RLE] The usages of the result of Load at [14,13] have been replaced by the value at [13,5]
// ASSERT: scan [RLE] The usages of the result of Load at [15,13] have been replaced by the value at [13,5]
// ASSERT: scan [RLE] The usages of the result of Load at [15,17] have been replaced by the value at [13,5]
// ASSERT: scan [RLE] The usages of the result of Load at [17,13] have been replaced by the value at [16,5]
