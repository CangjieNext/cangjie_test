/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_03_a01_09

  @Level:         1

  @Assertion:    3.2.3.3(1) The scope of classes/interface/struct’s members is the entire class/interface/struct
                  definition.

  @Description:  Check that class protected functions cannot be accessible outside the class definition.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

class C1 {
    protected func sayHelloWorld() {
        print("Hello World")
    }
}

main() {
    sayHelloWorld() // compilation error: undeclared identifier 'sayHelloWorld'
}
