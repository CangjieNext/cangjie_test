/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a02_02

  @Level:         1

  @Assertion:    10.1.3.1(2) If the scope levels of the two functions are the same,
                 the function is selected based on the rules in closest match rule.
  
  @Description:  Scopes in enclosed routines. There are some candidates due to default arguments

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class Base {
    var i8 : Int8    =0;
    var i16: Int16   =0;
    var i32: Int32   =0;
    var i64: Int64   =0;

    init(x: Int8) {
        this.i8 = x
    }
    init(x: Int16) {
        this.i16 = x
    }
    init(x: Int32) {
        this.i32 = x
    }
    init(x: Int64) {
        this.i64 = x
    }

}
class Sub <: Base {
    var Ki8 : Int8    =0;
    var Ki16: Int16   =0;
    var Ki32: Int32   =0;
    var Ki64: Int64   =0;

    init(x: Int8) {
        super(x)
        this.Ki8  = super.i8
    }
    init(x: Int16) {
        super(x - 1)
        this.Ki16  = super.i16 + 1
    }
    init(x: Int32) {
        super(x)
        this.Ki32  = super.i32
    }
    init(x: Int64) {
        super(x)
        this.Ki64  = super.i64
    }
}

func SCheck<T,TA>(a:T, b:TA) {
}


func SCheck<T, TA>(a:T,b!: Bool = false) {
    Assert.isTrue(b)
}
main(ina :Array<String>) {
    var b32 : Base = Base(0x04030201i32)
    SCheck<Base,Int32>(b32,b32.i32)
    0
}

