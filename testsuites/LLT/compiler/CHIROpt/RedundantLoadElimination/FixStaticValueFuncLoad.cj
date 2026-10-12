// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: regex-begin Store\(@_CN7default3Aoo4moo4Hv
// ASSERT: regex-after Apply\(Class-_CN7default3AooE->@_CN7default3Aoo4moo4Hv\)
// ASSERT: regex-not \(\) -> Int64 = Load\(

class Aoo {
    public static var b: Int32 = 2
    public static func moo4() {
        b;
        return 2
    }
    public func noo4() {
        var a = moo4
        return a
    }
}

main(): Int64 {
    var a = Aoo()
    if (a.noo4()() != 2) {
        return 4
    }
    return 0
}
