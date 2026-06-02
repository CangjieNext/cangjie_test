/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a21_01

  @Level:         1

  @Assertion:   2.1.1(21) The length of IntNative/UIntNative is the same as word size of the native system.

  @Description:  Checks that cangjie type 'IntNative/UIntNative' is mapped to C type 'ssize_t/size_t' which
                 size depends on native system.

  @Mode:         run

  @Negative:     no

  @Structure:    single


*/

import utils.assert.Assert

foreign func get_size_t_max(): UIntNative
foreign func get_ssize_t_max(): IntNative

foreign func set_01(x: UIntNative): Unit
foreign func get_01(): UIntNative

foreign func set_02(x: IntNative): Unit
foreign func get_02(): IntNative

main() {
    var Val1: UIntNative
    unsafe {
        let max1: UIntNative = get_size_t_max()
        let Data1 : Array<UIntNative> = [0, 127, 128, 32767, 32768, 65535, max1]
        for (item in Data1) {
            set_01(item)
            Val1 = get_01()
            Assert.equals(item, Val1)
        }
    }

    var Val2: IntNative
    unsafe {
        let max2: IntNative = get_ssize_t_max()
        let Data2 : Array<IntNative> = [-max2-1, -32768, -128, 0, 127, 32767, max2]
        for (item in Data2) {
            set_02(item)
            Val2 = get_02()
            Assert.equals(item, Val2)
        }
    }

}
