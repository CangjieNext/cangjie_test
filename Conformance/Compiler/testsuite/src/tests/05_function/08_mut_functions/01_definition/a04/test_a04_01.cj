/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_01_a04_01

  @Level:         1

  @Assertion:       5.8.1(4)
                    struct Foo { 
                        var i = 0 
                        mut func f() { 
                            this.i += 1 // ok 
                            i += 1 // ok 
                        } 
                    } 
                    main() { 
                        var a = Foo() 
                        print(a.i) // 0 
                        a.f() 
                        print(a.i) // 2 
                        a.f() 
                        print(a.i) // 4 
                        return 0 
                    } 

  @Description:     Positive example from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

struct Foo { 
    var i = 0 
    mut func f() { 
        this.i += 1 // ok 
        i += 1 // ok 
    } 
} 

main() { 
    var a = Foo() 
    print(a.i) // 0 
    Assert.equals(0, a.i)
    a.f() 
    print(a.i) // 2 
    Assert.equals(2, a.i)
    a.f() 
    print(a.i) // 4 
    Assert.equals(4, a.i)
    return 0 
} 
