/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a02_03_static_in_class_neg

  @Level:         1

  @Assertion:    10.1.1(2) 1.Static member functions and instance member functions 
                 of an class, interface, struct type cannot be overloaded with each other.

  @Description:  Compiler do not permit overloading beetween  static member
                 and instance member in class

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/



class Klass {
    
    static func Check(arg:Int8) {
    }

    func Check(arg:Int8) {
    }

}

main(ina :Array<String>) {
    var kl:Klass;
    0
}
