/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_03_a04_04

  @Level:         1

  @Assertion:       5.8.3(4)
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
                        var a = Foo() 
                        var fn = a.f // error 
                        var b: I = Foo() 
                        fn = b.f // ok 
                        return 0 
                    } 
                    func g1<T>(v: T): Unit where T <: I { 
                        let fn = v.f // error 
                    } 
                    func g2<T>(v: T): Unit where T <: Bar & I { 
                        let fn = v.f // ok 
                    } 

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issues:          6297

*/

interface I { 
    mut func f(): Unit 
}

main() { 
} 

func g1<T>(v: T): Unit where T <: I { 
    let fn = v.f // error 
} 
