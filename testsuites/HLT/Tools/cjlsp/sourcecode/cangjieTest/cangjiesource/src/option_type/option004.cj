/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.option_type

class OptionC {
    var item: Int64 = 100
}

let c = OptionC()
let c1 = Option<OptionC>.Some(c)
let c2 = Option<OptionC>.None

let r1 = c1?.item
let r2 = c2?.item
