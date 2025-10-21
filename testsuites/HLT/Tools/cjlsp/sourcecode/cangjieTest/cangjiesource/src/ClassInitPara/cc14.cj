/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.ClassInitPara

class CCC2<T, U> {
    CCC2(n1: T, var n22: U, var n32!: U) {
        var a = n1
        n22
        n32
    }
}
