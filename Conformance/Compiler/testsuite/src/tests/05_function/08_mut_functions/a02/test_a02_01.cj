/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_a02_01

  @Level:         1

  @Assertion:       5.8(2) We can use this feature to give struct type instance functions the ability to modify 
                    themselves for special scenarios. 

  @Description:     Check that struct fields can be modified with mut functions.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

import utils.assert.Assert

struct myStruct { 
    var counter: Int64 = 0 
    var flag: Bool = true 
    public mut func increase(): Unit { 
        counter += 1 
    }
    public mut func decrease(): Unit { 
        counter -= 1 
    }
}

extend myStruct {
    public mut func setFalse(): Unit { 
        flag = false 
    }
    public mut func setTrue(): Unit { 
        flag = true 
    }
}

main() { 

    var myStructImpl = myStruct() 
    Assert.equals(true, myStructImpl.flag)
    Assert.equals(0, myStructImpl.counter)

    myStructImpl.setFalse()
    Assert.equals(false, myStructImpl.flag)

    myStructImpl.setTrue()
    Assert.equals(true, myStructImpl.flag)

    myStructImpl.increase()
    Assert.equals(1, myStructImpl.counter)

    myStructImpl.decrease()
    Assert.equals(0, myStructImpl.counter)

    return 0 
} 
