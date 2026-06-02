/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_02_a05_01

  @Level:         1

  @Assertion:       5.8.2(5)
                    interface I { 
                        mut func f(): Unit 
                    } 
                    struct Foo <: I { 
                        var v = 0 
                        mut func f(): Unit { 
                            v += 1 
                        } 
                    } 
                    main() { 
                        var a = Foo() 
                        var b: I = a 
                        b.f() 
                        print(a.v) // 0 
                        return 0 
                    } 

  @Description:     Positive example from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issues:          6297

*/
import utils.assert.Assert

interface I { 
    mut func f(): Unit 
} 

struct Foo <: I { 
    var v = 0 
    public mut func f(): Unit { 
        v += 1 
    } 
}
 
main() { 
    var a = Foo() 
    Assert.equals(0, a.v) 
    var b: I = a 
    b.f() 
    print(a.v) // 0
    Assert.equals(0, a.v) 
    return 0 
} 