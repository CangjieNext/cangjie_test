// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %disableCodegen %enableO2 -Woff all %f -o %n.%suffix 2>&1 | compare %f

struct SA {
    var x = 999
    let y = 777
}

func goo(sa: SA) {
    println(sa.x)
}

func foo(cond: Bool) {
    var sa = SA()
    println(sa.y)
    goo(sa)
    println(sa.x)
    goo(sa)
}

main() {
    foo(true);
    0
}

// ASSERT: scan [RLE] The usages of the result of Load at [21,9] have been replaced by the value at [19,5]
// ASSERT: regex-not \[RLE\] The usages of the result of Load at \[23,.*] have been replaced by the value at .*
