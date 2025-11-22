/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testFunctype

func f18() {
    let a: (p1: EF) -> EF = {a => EF.MN}
    let a2: (p1: EF, p2: EF) -> EF = {a: EF, b: EF => b}
}

enum EF {
    XY | MN
}
