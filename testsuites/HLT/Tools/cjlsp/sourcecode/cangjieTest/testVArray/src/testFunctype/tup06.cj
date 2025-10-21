/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testFunctype

class ABC {}

func f6() {
    let a: (p1: ABC, p2: Int64) -> Int64
    let b: (ABC, Int64) -> Int64
}
