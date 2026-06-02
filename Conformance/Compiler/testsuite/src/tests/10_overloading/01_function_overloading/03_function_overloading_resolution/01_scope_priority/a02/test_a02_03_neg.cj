/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a02_03_neg

  @Level:         1

  @Assertion:    10.1.3.1(2) If the scope levels of the two functions are the same,
                 the function is selected based on the rules in closest match rule.
  
  @Description:  Scopes in enclosed routines. Compiler cannot solve overloading
                 for routines with generic argumentd

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/


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
    func Check<T1,T2,T3>(a1:T1, a2:T2,a3:T3) :Int64 {
        return 1
    }
    func Check<U1,U2,U3>(a1:U1, a2:U2,a3:U3) :Int64 {
        return 2
    }

}
main(ina :Array<String>) {
    var v:Base = Base()
    v.Check<Float32,Int64,Bool>(1.0, 1, true)
    0
}

