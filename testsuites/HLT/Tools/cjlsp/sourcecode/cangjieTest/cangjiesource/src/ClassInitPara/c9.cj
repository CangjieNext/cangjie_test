/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.ClassInitPara

class Empty {
    init(a: Int64) {}
    Empty(a: UInt8) {}
}

let GLOBALA: UInt8 = 1
var w1 = Empty(GLOBALA)
