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
    sa.mutFunc2()
    goo(sa)
    goo(sa)
    goo(sa)
}

main() {
    foo(true)
}

// ASSERT: scan [RLE] The usages of the result of Load at [30,9] have been replaced by the value at [29,5]
// ASSERT: scan [RLE] The usages of the result of Load at [33,9] have been replaced by the value at [32,9]
// ASSERT: scan [RLE] The usages of the result of Load at [34,9] have been replaced by the value at [32,9]
