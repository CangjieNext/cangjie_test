/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         02_01_03_a07_01

  @Level:         1

   @Assertion:    2.1.3(7) 
    main() {
      let bool1: Bool = true
      var bool2: Bool = false
      bool2 = true // assignment
      bool2 &&= bool1 // bool2=true
      bool2 ||= bool1 // bool2=true
      true == false // return false
      true != false // return true
      !false // logical NOT, return true
      true && false // logical AND, return false
      false || false // logical OR, return false
      return 0
    }

   @Description:  Check that code sample works

   @Mode:         run

   @Negative:     no

   @Structure:    single

   @Comment:

 */

import utils.assert.Assert

main() {
  var bool1: Bool = true
  var bool2: Bool = false

  bool2 = true 

  bool2 &&= bool1 
  Assert.isTrue(bool2)

  bool2 ||= bool1 
  Assert.isTrue(bool2)

  Assert.isFalse(true == false)
  Assert.isTrue(true != false)
  Assert.isTrue(!false)    
  Assert.isFalse(true && false)     
  Assert.isFalse(false || false)    
  return 0
}