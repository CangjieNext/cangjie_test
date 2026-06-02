// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package demo

import macro_demo.*
import windows.*

main(): Int64 {
    let a: Int64 = @TestDef(1 + 2)
    println("a = ${a}")
    getLog()
    return 0
}
