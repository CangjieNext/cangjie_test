/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_03_a02_01

  @Level:         1

  @Assertion:       5.8.3(2)
                    interface I { 
                        mut func f(): Unit 
                    } 
                    struct Foo <: I { 
                        var i = 0 
                        mut func f(): Unit { 
                            i += 1 
                        } 
                    } 
                    class Bar <: I { 
                        var i = 0 
                        func f(): Unit { 
                            i += 1 
                        } 
                    } 
                    main() { 
                        let a = Foo() 
                        a.f() // error 
                        var b = Foo() 
                        b.f() // ok 
                        let c: I = Foo() 
                        c.f() // ok 
                        return 0 
                    } 
                    func g1<T>(v: T): Unit where T <: I { 
                        v.f() // error 
                    } 
                    func g2<T>(v: T): Unit where T <: Bar & I { 
                        v.f() // ok 
                    }
                    
  @Description:     Positive example from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issues:          6297

*/

interface I { 
    mut func f(): Unit 
}

struct Foo <: I { 
    var i = 0 
    public mut func f(): Unit { 
        i += 1 
    } 
}

main() { 
    var b = Foo() 
    b.f() // ok 
    let c: I = Foo() 
    c.f() // ok 
    return 0 
} 
