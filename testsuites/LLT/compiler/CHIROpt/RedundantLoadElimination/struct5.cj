// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %disableCodegen %enableO2 -Woff all %f -o %n.%suffix 2>&1 | compare %f

struct SC {
    var y = 111
    mut func mutFunc1() {
        y = 222
    }
}

struct SA {
    var x = 999
    var sc = SC()
    mut func mutFunc2() {
        x = 777
    }
}

func goo(sa: SA) {
    println(sa.x)
}

func foo(cond: Bool) {
    var sa = SA()
    goo(sa)
    try {
        sa.mutFunc2()
    } finally {}
    goo(sa)
    sa = SA()
    try {
        sa.sc.mutFunc1()
    } finally {}
    goo(sa)
}

main() {
    foo(true);
    0
}

// ASSERT: scan [RLE] The usages of the result of Load at [30,9] have been replaced by the value at [29,5]
// ASSERT: regex-not \[RLE\] The usages of the result of Load at [34,.*] have been replaced by the value at .*
// ASSERT: regex-not \[RLE\] The usages of the result of Load at [39,.*] have been replaced by the value at .*
