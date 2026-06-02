/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_a02_02

  @Level:         1

  @Assertion:       5.8(2) We can use this feature to give struct type instance functions the ability to modify 
                    themselves for special scenarios. 

  @Description:     Check that struct fields can't be modified with non-mut functions.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct myStruct { 
    var counter: Int64 = 0 
    public func increase(): Unit { 
        counter += 1 
    }
}

main() { 
} 
