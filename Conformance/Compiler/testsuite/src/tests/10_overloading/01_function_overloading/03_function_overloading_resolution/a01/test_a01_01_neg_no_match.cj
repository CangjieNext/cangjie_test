/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_a01_01_neg_no_match

  @Level:         1

  @Assertion:    10.1.3(1)
                 Function overloading Resolution
                 If there is no matching function declaration 
                 (i.e., with the right name and parameter types) in the scope,
                 a compilation error is reported.


  @Description:  No matches for called functions and its argument type
                 Compiler emits error. No such argument

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/



open class Klass {
    
    func Check(arg:Float64) { 
    }
    func Check(arg:Float32) { 
    }
    func Check(arg:Float16) { 
    }

}

extend Klass {
    
    func Check(arg:UInt8) {
    }
    func Check(arg:UInt16) {
    }
    func Check(arg:UInt32) {
    }
    func Check(arg:UInt64) {
    }
}


main(ina :Array<String>) {

    var kl: Klass = Klass();
    kl.Check(0i8)
    0
}



