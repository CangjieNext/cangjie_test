// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

import b.macroDefinition.X1 as x
import b.macroDefinition.X2 as test

main() {
    println("start")
    @x(0)
    @test[1](0)
    @test[1](-1) + @test(0)
    println("end")
}
