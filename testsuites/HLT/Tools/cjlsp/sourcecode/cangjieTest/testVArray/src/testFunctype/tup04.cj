/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testFunctype

struct SS1 {
    let bb1: (p1: Int64, p2: Int64) = (1, 2)
    let bb2: (p1: Int64, p2: Bool) = (1, true)
    let bb3: (p4: (p1: Int64, p2: Int64), p3: Int64) = ((1, 2), 3)
    let bb4: (p1: Int64, p2: Bool) = (2, false)
}

func f4() {
    var a = SS1().bb1
}
