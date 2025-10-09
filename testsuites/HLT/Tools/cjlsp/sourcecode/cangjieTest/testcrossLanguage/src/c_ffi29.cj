/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

foreign func funcconstruct(a: Int64, b: Int64): Int64

enum EE {
    EEXY(Int64, Int64)
}

unsafe func test29() {
    var aa = EE.EEXY(funcconstruct(1, 2), funcconstruct(3, 4))
}
