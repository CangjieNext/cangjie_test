/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.ClassInitPara

open class C2 {
    C2(a: Int64, b!: Int32) {}
    func C2() {}
}

var c1 = C2(1, b: 2)
var c2 = c1.C2()
