/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Composition

func foo(a: Int64):Int64 {
    func foo1(a: Int64) {
        a
    }
    return a

    var res4 = foo1 ~> foo
    var res5 = foo1 ~> foo1
    return 0
}
