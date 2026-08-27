// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CINac10LinkedListIG_E8iteratorHv$l
// ASSERT: scan-not Invoke(@_CINac10LinkedListIG_E8iteratorHv$l

import std.collection.LinkedList

func test<T>(): Collection<T> {
    return LinkedList<T>()
}

main() {
    let list: Collection<Int64> = LinkedList<Int64>(3)
    for (i in list) {
    }
    0
}
