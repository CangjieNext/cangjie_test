/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_a01_01

  @Level:         1

  @Assertion:       5.8(1) The mut function is a special kind of instance member function. Inside the mut function, 
                    the semantics of this is special, and this this has the ability to modify the field in-place, 
                    with the changes taking effect immediately.

  @Description:     Check that struct fields can be modified in place with immediately effect.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

import utils.assert.Assert

struct myStruct { 
    var counter: Int64 = 0 
    var flag: Bool = true 
    public mut func myFlagFunc(): Unit { 
        flag = !flag 
    }
}

extend myStruct {
    public mut func myIncreaseCounter(): Unit { 
        counter += 1 
    }
    public mut func myDecreaseCounter(): Unit { 
        counter -= 1 
    }
}

main() { 

    var myStructImpl = myStruct() 
    Assert.equals(true, myStructImpl.flag)
    Assert.equals(0, myStructImpl.counter)
    myStructImpl.myFlagFunc()
    Assert.equals(false, myStructImpl.flag)

    Assert.equals(0, myStructImpl.counter)
    myStructImpl.myIncreaseCounter()
    Assert.equals(1, myStructImpl.counter)
    myStructImpl.myIncreaseCounter()
    Assert.equals(2, myStructImpl.counter)
    myStructImpl.myDecreaseCounter()
    Assert.equals(1, myStructImpl.counter)
    myStructImpl.myDecreaseCounter()
    Assert.equals(0, myStructImpl.counter)

    return 0 
} 
