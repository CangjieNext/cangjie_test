/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testConst

func test30() {
    const aa = 0
    const bb = 1
    const (x, y) = (aa, bb)
    const c: VArray<Int64, $2> = [aa, bb]
}
