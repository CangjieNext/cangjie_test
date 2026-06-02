/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_a01_03

  @Level:         1

  @Assertion:       5.8(1) The mut function is a special kind of instance member function. Inside the mut function, 
                    the semantics of this is special, and this this has the ability to modify the field in-place, 
                    with the changes taking effect immediately.

  @Description:     Check that struct static member function can't be mut: in struct extension.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct myStruct { 
    var counter: Int64 = 0 
}

extend myStruct {
    public static mut func myIncreaseCounter(): Unit { 
        counter += 1 
    }
}

main() { 
} 
