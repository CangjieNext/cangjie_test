/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testFunctype

func f17() {
    let a: (p1: DE, p2: Int64) -> Int64
    let b: (p1: Int64, p2: String) -> Int64
}

class DE {
    init() {}
    DE(p1: DE, p2: Int64) {}
}
