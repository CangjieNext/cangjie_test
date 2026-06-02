/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a05_03

  @Level:         1

  @Assertion:    13.1.3.4(5) However, when the argument is passed, it is still passed as CPointer<T>

  @Description:  Checks inout behavior for VArray argument passed from native code to Cangjie function.

  @Comment:      This assertion refines properties of VArray argument in CFunc invocation,
                see previous assertion for context.

  @Mode:         run

  @Negative:     no

  @Structure:    single
  @Issue:        0006077


*/

import utils.assert.Assert

foreign func wrapper(buf: VArray<UInt8, $10>): Unit

@C public func changer(buf: CPointer<UInt8>) {
    for(it in 0..10) {
        unsafe{ buf.write(it, buf.read(it) + 10) }
    }
}

main() {
    var arr = VArray<UInt8, $10> { i => UInt8(i)}
    unsafe { wrapper(inout arr) }
    for (i in 0..10) {
        Assert.equals(UInt8(i+10), arr[i])
    }
}
