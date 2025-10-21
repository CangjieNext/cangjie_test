/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testVArray

func test13() {
    let a = 3
    let a2 = 6
    let b: VArray<Int64, $3> = [1, 4, a2]
    let c: VArray<Int64, $5> = [1, 2, 3, 4, a]
}
