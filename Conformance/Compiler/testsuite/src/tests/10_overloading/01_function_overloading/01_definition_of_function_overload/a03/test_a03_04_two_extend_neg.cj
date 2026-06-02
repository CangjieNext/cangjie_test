/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a03_04_two_extend_neg

  @Level:         1

  @Assertion:    10.1.1(3) 2.Static member functions and instance member functions of extends
                 of the same type cannot be overloaded with each other, except that two functions 
                 in extensions of the same type both are private

  @Description: Compiler emit error as it was found overloading btw static and instance member
                in different extensions

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/



class Klass {
    var o: Int32
    init(x: Int32) {
        this.o = x
    }
    

}
extend Klass {
    static func SCheck(arg:IntNative) {
    }
    func CheckI(arg:IntNative) {
        SCheck(IntNative(-5))
    }
}

extend Klass {
    static func CheckI(arg:UIntNative) {
    }
    func Check(arg:UIntNative) {
        CheckI(UIntNative(5))
    }
}

main(ina :Array<String>) {
    var kl:Klass = Klass(0);
    0
}
