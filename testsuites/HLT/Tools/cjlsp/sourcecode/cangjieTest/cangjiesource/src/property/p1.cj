/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.property

import default.property.pkg.*

func test1() {
    var x = C1()
    var y = x.b + 1
    x.b = y
    return 0
}
