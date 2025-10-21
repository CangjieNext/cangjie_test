/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

class C13 {
    C13(a: Int64) {}
    public var t1:Int64 = 1
    public static var t2:Int64 = 2
}

type MM = C13
type A1A = MM

func f13() {
    var x1: A1A = A1A(1)
    A1A.t2
    x1.t1
}
