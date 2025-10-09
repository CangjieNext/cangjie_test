/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.ClassInitPara

class VV11<T> {
    VV11(a: T, b: String, c!: Int64 = 1) {}
}

var a1 = VV11(1, "b: String")
var a2 = VV11(1, "b: String", c: 1)
