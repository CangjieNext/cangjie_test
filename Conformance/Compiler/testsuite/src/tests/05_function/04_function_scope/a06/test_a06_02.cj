/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a06_02

  @Level:         1

  @Assertion:       5.4(6) • Member functions 
                    Member functions can be declared or defined in the type definition. The scope of a member 
                    function is the entire type and its extensions.

  @Description:     Check that class member function is not accesible directly w/o own entire type from main method.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class myClass { 
    func bar() {}
} 

main() {
    return bar()
}
