/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

struct CC2 {
    CC2(name2: String, var annotation2: String, var nn!: Bool = true) {}
}

let m11: CC2 = CC2("name2: String", "annotation2: String", nn: false)
let m22 = CC2("", "annotation2: String", nn: false)
