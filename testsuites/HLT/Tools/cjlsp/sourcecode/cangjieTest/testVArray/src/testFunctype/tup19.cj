/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testFunctype

func test19() {
    let bb1: (`abstract`: Int64, `as`: Int64) = (1, 2)
    let p1: (p1: Int64, p2: Bool, p3: VArray<Int64, $5>) = (1, true, [1, 2, 3, 4, 5])
}
