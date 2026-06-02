/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a05_01

  @Level:         1

  @Assertion: 10.2.4(5)
              The return type can be of any type. 

  @Description: Check that get form of index operator can return any type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C<T> {
    init(inX: T) {
        x = inX
    }

    operator func[](index: Int64): T {
        x
    }

    var x: T
}

main() {
    Assert.isTrue(C<Int64>(5)[0] is Int64)
    Assert.isTrue(C<Int32>(5)[0] is Int32)
    Assert.isTrue(C<UInt64>(5)[0] is UInt64)
    Assert.isTrue(C<UInt32>(5)[0] is UInt32)
    Assert.isTrue(C<Float64>(5.0)[0] is Float64)
    Assert.isTrue(C<Float32>(5.0)[0] is Float32)
    Assert.isTrue(C<Bool>(true)[0] is Bool)
    Assert.isTrue(C<String>("hi")[0] is String)
    Assert.isTrue(C<C<String>>(C<String>("hi"))[0] is C<String>)
    Assert.isTrue(C<() -> Unit>({ => })[0] is () -> Unit)
}

