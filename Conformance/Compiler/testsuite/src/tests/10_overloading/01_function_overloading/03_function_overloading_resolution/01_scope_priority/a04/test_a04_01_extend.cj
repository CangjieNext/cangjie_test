/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a04_01_extend

  @Level:         1

  @Assertion:    10.1.3.1(4) 2. Functions defined in the type and the extension of the type
                 are processed as the same scope priority during when the functions are overloaded.
  
  @Description:  Compiler emits error, when function in class and extend have same profile
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/



class Klass {
    var o: Int32
    init(x: Int32) {
        this.o = x
    }
    
    static func SCheck(arg:IntNative) : IntNative {
        return IntNative(0)
    }

}
extend Klass {
    static func SCheck(arg:IntNative) {
    }
    static func SCheck(arg:UIntNative) {
    }
}

main(ina :Array<String>) {
    0
}
