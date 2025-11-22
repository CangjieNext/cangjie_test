/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testConst

enum E4 {
    MN

    const func fe(a: VArray<Int64, $4>) {}
}

func test27() {
    var i1 = E4.MN.fe([1, 2, 3, 4])
}
