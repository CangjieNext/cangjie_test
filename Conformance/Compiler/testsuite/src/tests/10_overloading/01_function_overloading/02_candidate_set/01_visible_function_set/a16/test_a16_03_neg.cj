/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a16_03_neg

  @Level:         1

  @Assertion:    10.1.2.1(16) If present in a type extension, the visible function
                 set contains both the non-static member method f in the type and in the extension.

  @Description:  Emit error as overloaded function is duplicated in class and extend

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/




open class Klass {
    var obj :Int8;
    init(inival:Int8) {
        this.obj = inival
    }

    public  func SCheck(arg:Int8) {
    }
    public  func SCheck(arg:Int16) {
    }
    public  func SCheck(arg:Int32) {
    }
    public  func SCheck(arg:Int64) {
    }
    
    public  func SCheck(arg:UInt8) {
    }
    public  func SCheck(arg:UInt16) {
    }
    public  func SCheck(arg:UInt32) {
    }
    public  func SCheck(arg:UInt64) {
    }
    
    public  func SCheck(arg:Float16) {
    }
    public  func SCheck(arg:Float32) {
    }
    public  func SCheck(arg:Float64) {
    }   
    func Check(arg:Int8) {
        this.SCheck(arg)
    }
    func Check(arg:Int16) {
        this.SCheck(arg)
    }
    func Check(arg:Int32) {
        this.SCheck(arg)
    }
    func Check(arg:Int64) {
        this.SCheck(arg)
    }
}

extend Klass {
    func Check(arg:Int64) {
        this.SCheck(arg)
    }
    func Check(arg:Int64) {
        this.SCheck(arg)
    }
    
    func Check(arg:UInt8) {
        this.SCheck(arg)
    }
    func Check(arg:UInt16) {
        this.SCheck(arg)
    }
    func Check(arg:UInt32) {
        this.SCheck(arg)
    }
    func Check(arg:UInt64) {
        this.SCheck(arg)
    }
    func Check(arg:Float16) {
        this.SCheck(arg)
    }
    func Check(arg:Float32) {
        this.SCheck(arg)
    }
    func Check(arg:Float64) {
        this.SCheck(arg)
    }
}


main(ina :Array<String>) {
    0
}



