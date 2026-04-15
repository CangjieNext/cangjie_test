// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package aaa

import define_a.*
import define_b.*

main() {
    @testa(0)
    @testaa(0)
    @testaaa(0)
    @testAttr[1+](0)
    @testAttr2[1](0)

    @testa var a = 1
    @testaa var b = 1
    @testaaa var c = 1

    @testAttr2[public]
    func firstF() {
        0
    }

    @testAttr2[1] var d = 1

    @testb(0)
    @testbb[1+](0)
    return 0
}
