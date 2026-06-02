/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_06_a14_01

  @Level:         1

  @Assertion:       5.6(14)
                    class C { 
                        static var a: Int32 = 0 
                        static func foo() { 
                            a++         // OK 
                            return a 
                        } 
                    } 
                    var globalV1 = 0 
                    func countGlobalV1() { 
                        globalV1++ 
                        C.a = 99 
                        let g = C.foo     // OK 
                    } 
                    func g(){ 
                        let f = countGlobalV1 // OK 
                        f() 
                    } 

  @Description:     Positive examples from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class C { 
    static var a: Int32 = 0 
    static func foo() { 
        a++         // OK 
        return a 
    } 
} 
 
var globalV1 = 0 
func countGlobalV1() { 
    globalV1++ 
    C.a = 99 
    let g = C.foo     // OK 
} 

func g(){ 
    let f = countGlobalV1 // OK 
    f() 
} 

main() {
    Assert.equals(0,C.a)
    Assert.equals(1,C.foo())
    Assert.equals(1,C.a)

    Assert.equals(0,globalV1)
    countGlobalV1()
    Assert.equals(1, globalV1)
    Assert.equals(99,C.a)

    g()
    Assert.equals(2,globalV1)
    Assert.equals(99,C.a)

}
