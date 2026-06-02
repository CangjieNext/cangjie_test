/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a05_01_2extend

  @Level:         1

  @Assertion:    10.1.3.1(5) 3. Functions defined in different extensions of 
                 the same type in the candidate set are processed as the same 
                 scope priority when the functions are overloaded
  
  @Description:  Compiler emits error, we have overloaded functions in 
                 different extensions
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/



open class Klass {
    var o: Int32
    init(x: Int32) {
        this.o = x
    }    
}
extend Klass {
    static func SCheck(arg:IntNative) :Int64 {
        0
    }
    static func SCheck(arg:UIntNative):Int64 {
        0
    }
}

extend Klass {
    static func SCheck(arg:IntNative) : IntNative {
        return IntNative(0)
    }
 }


main(ina :Array<String>) {
    0
}
