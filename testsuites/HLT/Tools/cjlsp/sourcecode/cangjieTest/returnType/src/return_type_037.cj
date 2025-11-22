/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package returnType

open class C371 {
    func f(): This {  // its type is `() -> C1`
        return this
    }

    func f2() { // its type is `() -> C1`
        return this
    }

    public open func f3() {
        return this
    }
}
class C372 <: C371 {
    // member function f is inherited from C1, and its type is `() -> C2` now
    public override func f3() { // Ok
        return this
    }
}

func test37() {
    var obj1: C372 = C372()
    obj1
    var obj2: C371 = C371()
    obj2
}
