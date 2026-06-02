// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan 12
interface interface1 {
    func func789(): Int64
}

interface interface2 <: interface1 {}

class cassB <: interface2 {
    public func func789() {
        12
    }
}

main() {
    var zz = cassB()
    var x: (Int64, interface2) = (12, zz)
    println(x[1].func789())
    return 0
}
