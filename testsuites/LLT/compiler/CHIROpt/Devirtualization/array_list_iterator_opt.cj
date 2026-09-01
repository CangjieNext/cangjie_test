// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
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
    // LinkedList(n) is a single-element list; use 3 elements for a real count check.
    let list: Collection<Int64> = LinkedList<Int64>([0, 1, 2])
    var count = 0
    for (i in list) {
        count += 1
    }
    count - 3
}
