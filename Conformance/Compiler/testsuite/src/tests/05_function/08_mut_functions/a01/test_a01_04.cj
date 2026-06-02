/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_a01_04

  @Level:         1

  @Assertion:       5.8(1) The mut function is a special kind of instance member function. Inside the mut function, 
                    the semantics of this is special, and this this has the ability to modify the field in-place, 
                    with the changes taking effect immediately.

  @Description:     Check that struct member  operator can be mut: in struct definition.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6298

*/

struct myStruct { 
    mut operator func +(a: myStruct): myStruct { 
        return myStruct() 
    } 
    func res() {
        return 0
    }
}

main() {
  var s1 = myStruct()
  var s2 = s1 + s1
  return s2.res()
} 
