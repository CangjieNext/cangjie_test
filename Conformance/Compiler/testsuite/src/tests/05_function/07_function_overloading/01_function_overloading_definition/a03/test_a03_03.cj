/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a03_03

  @Level:         1

  @Assertion:       5.7.1(3) – Constructors defined within a class or struct, including primary constructor and init 
                    constructors. 

  @Description:     Check that constructors defined within a struct with the same parameters will produce an overload 
                    conflict.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct myStruct {
    var myVar: Rune = 'A'
    init(name: String, age: Int32, gender: Bool) { 
        this.myVar = 'E'
    }
    myStruct(name: String, age: Int32, gender: Bool) {
        this.myVar = 'B'
    }
}

main() {
}
