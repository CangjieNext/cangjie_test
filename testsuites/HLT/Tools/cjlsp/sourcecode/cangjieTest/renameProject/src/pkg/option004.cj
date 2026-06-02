/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

class CD {
    var item: Int64 = 100
}

let ca = CD()
let ca1 = Option<CD>.Some(ca)
let ca2 = Option<CD>.None

let ra1 = ca1?.item
let ra2 = ca2?.item
