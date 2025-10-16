/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testFunctype

struct SS2 {
    let mm: Int64
    SS2(aa: Int64, var bb: (p1: Int64, p2: VArray<Int64, $2>)) {
        this.mm = aa
    }
}

func test21() {
    var a1 = SS2(1, (1, [6, 7]))
}
