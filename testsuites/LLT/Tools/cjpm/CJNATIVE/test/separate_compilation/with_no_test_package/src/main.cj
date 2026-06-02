// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package testg

import testg.koo.concatk

main(): Int64 {
    let res2 = concatM("a", "b")
    let res3 = concatk("a", "b")
    println(res2)
    println(res3)
    return 0
}

public func concatM(s1: String, s2: String): String {
    return s1 + s2
}
