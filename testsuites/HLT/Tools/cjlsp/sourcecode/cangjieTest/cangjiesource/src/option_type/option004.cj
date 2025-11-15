package default.option_type

class C {
    var item: Int64 = 100
}

let c = C()
let c1 = Option<C>.Some(c)
let c2 = Option<C>.None

let r1 = c1?.item
let r2 = c2?.item

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
