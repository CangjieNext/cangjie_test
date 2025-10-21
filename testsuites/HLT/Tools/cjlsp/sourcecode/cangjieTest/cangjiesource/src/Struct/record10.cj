/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Struct

struct Box2<T> {
    var value: T
    Box2(value: T) {
        this.value = value
    }
}

var cc1 = Box2(2)
var CC2 = Box2<String>('a')
