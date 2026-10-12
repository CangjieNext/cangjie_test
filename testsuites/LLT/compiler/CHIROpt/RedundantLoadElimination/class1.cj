// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan-not Class-_CN7default2CAE& = Load(
// ASSERT: regex GetElementRef\(%\d+, 0\) // loc: "class1.cj"-25-13
// ASSERT: regex StoreElementRef\(%\d+, %\d+, 0\) // loc: "class1.cj"-26-5
// ASSERT: regex StoreElementRef\(%\d+, %\d+, 0\) // loc: "class1.cj"-28-5

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
