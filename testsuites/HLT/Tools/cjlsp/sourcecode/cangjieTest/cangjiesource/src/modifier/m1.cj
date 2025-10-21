/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.modifier

import default.modifier.pkg.*

func t1() {
    var a1 = Rectange()

    a1.aa
    var a2 = Rectange.num

    var b1 = Rect()
    b1.aa
    var b2 = Rect.num
}
