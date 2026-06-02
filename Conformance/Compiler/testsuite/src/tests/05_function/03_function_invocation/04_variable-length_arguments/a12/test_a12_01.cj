/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a12_01

  @Level:         1

  @Assertion:       5.3.4(12)
                    open class A{
                        func f(v:Int64 ):Unit {// f1
                        }
                    }
                    class B<:A {
                        func f(v:Array <Int64 >):Unit {// f2
                        }
                    }
                    func p1(){
                        let x=B()
                        x.f( 1)// call the f1
                    }
                    func g<T>(arg :T):Unit {// g1
                    }
                    func g(arg :Array <Int64 >):Unit {// g2
                    }
                    func p2(){
                        g(1)// call the g1
                    }
                    func h(arg :Any) :Unit {// h1
                    }
                    func h(arg :Array <Int64 >):Unit {// h2
                    }
                    func p3(){
                        h(1)// call the h1
                    }
  @Description:   Positive examples from spec

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

open class A{
    public func f(v:Int64 ):Unit {// f1
    }
}
class B<:A {
    func f(v:Array <Int64 >):Unit {// f2
    }
}
func p1(){
    let x=B()
    x.f( 1)// call the f1
}
func g<T>(arg :T):Unit {// g1
}
func g(arg :Array <Int64 >):Unit {// g2
}
func p2(){
    g(1)// call the g1
}
func h(arg :Any) :Unit {// h1
}
func h(arg :Array <Int64 >):Unit {// h2
}
func p3(){
    h(1)// call the h1
}

main() {
    Assert.isTrue(p1 is () -> Unit)
    Assert.isTrue(g<Int64> is (Int64) -> Unit)
    Assert.isTrue(g<Array<Int64>> is (Array<Int64>) -> Unit)
    Assert.isTrue(g is (Array<Int64>) -> Unit)
    Assert.isTrue(p2 is () -> Unit)
    Assert.isTrue(p3 is () -> Unit)

    var implA = A()
    Assert.isTrue(implA.f is (Int64) -> Unit)
}
