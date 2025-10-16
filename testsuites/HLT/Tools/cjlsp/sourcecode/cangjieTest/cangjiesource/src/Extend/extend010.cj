/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Extend

class Foo10 {}
extend Foo10 {
    private func f1() {}
    public func f2():Unit {}
    protected func f3() {}
    func f4() {}
}

func test010() {
    let a = Foo10()
    a.f2()
    a.f3()
    a.f4()

}
