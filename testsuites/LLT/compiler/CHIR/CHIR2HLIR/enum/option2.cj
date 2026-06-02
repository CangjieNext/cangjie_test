// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan 1\n1

class A {
    public func a() {
        return 1
    }
}

main() {
    var X = A()
    var Y: ?A = X
    var x = Y?.a() ?? -1
    print("${x}\n")
    print("${Y?.a() ?? -1}\n")
    return 0
}
