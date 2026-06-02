/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a07_01

  @Level:         1

  @Assertion:       5.5(7) If the specified return type is Unit, the Cangjie compiler will also insert return () 
                    (in the lambda body) properly at all possible places where the lambda could return so that its 
                    return type will always be Unit.

  @Description:     Check that if lambda return type specified as Unit - it is not required to insert () in possible 
                    places of expression - compiler will insert () automatically.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    let f0: (Int64, Int64) -> Unit = {a: Int64, b: Int64 => 
        if(a > b) {
            a + b 
        }
        b - a
    } 
}

struct myStruct {
    let f0: (Int64, Int64) -> Unit = {a: Int64, b: Int64 => 
        if(a > b) {
            (a - b)
        }
        (b - a)
    } 
}

main() {
    let f0: (Int64, Int64) -> Unit = {a: Int64, b: Int64 => 
        if(a > b) {
            (a - b)
        }
        (b - a)
    } 
    Assert.isTrue(f0(6, 1) is Unit)

    var myClassImpl = myClass()
    Assert.isTrue(myClassImpl.f0 is (Int64, Int64) -> Unit)
    Assert.isTrue(myClassImpl.f0(6, 1) is Unit)
    Assert.isTrue(myClassImpl.f0(1, 6) is Unit)

    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.f0 is (Int64, Int64) -> Unit)
    Assert.isTrue(myStructImpl.f0(6, 1) is Unit)
    Assert.isTrue(myStructImpl.f0(1, 6) is Unit)

}
