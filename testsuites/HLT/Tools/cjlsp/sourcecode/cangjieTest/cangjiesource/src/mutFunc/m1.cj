/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.mutFunc

struct A {
    mut func f(): Unit {}
    static func g() {}
    operator func +(r: A) {}
}

extend A {
    mut func h(): Unit {}
}

class B {
    func f(): Unit {}
}

interface I {
    mut func f(): Unit {}
}
