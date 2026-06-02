// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %disableCodegen %enableO2 -Woff all %f -o %n.%suffix 2>&1 | compare %f

class CA {
    var x = 1
}

func foo() {
    let obj1 = CA()
    println(obj1.x)
    obj1.x = 2
    var obj2 = CA()
    println(obj2.x)
    obj2.x = 3
    obj2 = CA()
    obj2.x = 3
}

main() {
    foo()
}

// ASSERT: scan [RLE] The usages of the result of Load at [18,13] have been replaced by the value at [17,5]
// ASSERT: scan [RLE] The usages of the result of Load at [19,5] have been replaced by the value at [17,5]
// ASSERT: scan [RLE] The usages of the result of Load at [21,5] have been replaced by the value at [20,5]
