/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a14_05_extend_neg

  @Level:         1

  @Assertion:    10.1.2.1(14) 3) If the function invocation is in the form of 
                 this.f(...), that is, the this.f(...) expression appears in 
                 the definition or extension of class, interface, struct, enum.

  @Description:  Overloaded function calls via this. Example with Extend.
                 Compiler emits error as extend try to call private func   

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/




open class Klass {
    var obj :Int8;
    init(inival:Int8) {
        this.obj = inival
    }

    private  func SCheck(arg:Int8) {
    }
    private  func SCheck(arg:Int16) {
    }
    private  func SCheck(arg:Int32) {
    }
    private  func SCheck(arg:Int64) {
    }
    
    private  func SCheck(arg:UInt8) {
    }
    private  func SCheck(arg:UInt16) {
    }
    private  func SCheck(arg:UInt32) {
    }
    private  func SCheck(arg:UInt64) {
    }
    
    private  func SCheck(arg:Float16) {
    }
    private  func SCheck(arg:Float32) {
    }
    private  func SCheck(arg:Float64) {
    }   
}

extend Klass {
    func Check(arg:Int8) {
        this.SCheck(arg)
    }
}


main(ina :Array<String>) {

    0
}



