/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a04_01_constr_inst_neg

  @Level:         1

  @Assertion:    10.1.1(4) 3.The constructors, static member functions,
                 and instance member functions of an enum type cannot be overloaded with each other

  @Description:  Compiler emits error when overloading with contructor and instance member was found

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/



enum ENUM {
    ZERO | ONE | TWO | THREE | Check
    static func SCheck(arg:Int8) {
    }
    func Check(arg:Float16) {
    }

}

main(ina :Array<String>) {
    var kl:ENUM = ZERO;
    0
}
