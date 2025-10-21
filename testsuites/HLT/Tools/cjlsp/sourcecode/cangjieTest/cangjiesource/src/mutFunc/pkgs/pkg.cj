/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.mutFunc.pkgs

public struct Foo {
    public var ii: Int64 = 0
    public mut func f(): Unit {
        this.ii += 1
        ii += 1
    }
}

func test() {
    var a = Foo()
    print(a.ii)
    a.f()
    print(a.ii)

    let b = Foo()

}
