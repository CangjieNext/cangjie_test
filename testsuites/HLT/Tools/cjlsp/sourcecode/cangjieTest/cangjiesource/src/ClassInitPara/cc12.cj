/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.ClassInitPara

class Box<T> {
    var value: T
    init(value: T) {
        this.value = value
    }
}

var cc1 = Box(1)
var CC2 = Box<Rune>('a')
