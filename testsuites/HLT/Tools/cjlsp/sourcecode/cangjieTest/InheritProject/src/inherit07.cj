/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkga.*

class B7 <: A7 {
    public static redef func name1() :Unit{}
}

func test7() {
    var a = B7.name1
    var b = A7.name1()
}
