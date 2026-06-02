/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_01_a02_02

  @Level:         1

  @Assertion:   2.1.10.1(2) All member variables defined outside the primary constructor 
                can have an initial value or no initial value. 

  @Description: Checks that the case, when some member variable, defined outside the 
                primary constructor, has not initial value and the primary constructor 
                does not contain initialization for that member variable, causes compilation error.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

struct MyStruct {
    public var var1: String;
    public var var2: Float32;

    MyStruct(init1: String) {
        this.var1 = init1;
    }
}

main() {
}


