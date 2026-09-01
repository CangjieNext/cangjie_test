// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(@_CIN7defaultXRNat5ArrayIG_E9getMySizeHv$l
// ASSERT: scan-not Invoke(Class-_CN7default6mySizeE&->@_CN7default6mySize9getMySizeHv

import std.collection.ArrayList
interface mySize {
    func getMySize(): Int64
}

extend<T> Array<T> <: mySize {
    public func getMySize(): Int64 {
        return 10
    }
}

extend<T> ArrayList<T> <: mySize {
    public func getMySize(): Int64 {
        return 8
    }
}

public class A<T> {
    let a: mySize = Array<T>()
}

main() {
    let a = A<Int64>()
    let b = a.a
    return b.getMySize() - 10
}