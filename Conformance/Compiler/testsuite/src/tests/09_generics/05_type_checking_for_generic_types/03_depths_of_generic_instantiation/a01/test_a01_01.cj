/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_03_a01_01

  @Level:         1

  @Assertion: 9.5.3(1) For avoiding infinite loop or exhausting memory during generic declaration instantiation, 
              compiler will restrict the depth of generic instantiation.

  @Description: Check that compiler restricts infinite instantiation.

  @Mode: compileonly

  @Negative: yes

*/

class IIC<T> {
    func hello(x: IIC<IIC<T>>): String {
        return "hello"
    }
}

main() {
    let x = IIC<Int32>()
    return
}

