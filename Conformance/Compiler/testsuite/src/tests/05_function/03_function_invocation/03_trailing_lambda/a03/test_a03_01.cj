/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_03_a03_01

  @Level:         1

  @Assertion:       5.3.3(3) We can also omit () and just write lambda when the function call has one and only one 
                    lambda real parameter. 

  @Description:     Positive examples from spec

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func myFunc(fn: (Int64)->Int64) { fn(3) } 
}

struct myStruct {
    func myFunc(fn: (Int64)->Int64) { fn(3) } 
}

enum myEnum {
    T

    func myFunc(fn: (Bool)->Bool) { fn(true) } 
}

func myFunc(fn: (Int64)->Int64) { fn(3) } 

main() {
    Assert.equals(6, myFunc({ i => i + i }))
    Assert.equals(6, myFunc(){ i => i + i })
    Assert.equals(6, myFunc{ i => i + i })
    Assert.isTrue(myFunc is ((Int64)->Int64) -> Int64)

    var myClassImpl = myClass()
    Assert.equals(0, myClassImpl.myFunc({ i => i - i }))
    Assert.equals(0, myClassImpl.myFunc(){ i => i - i })
    Assert.equals(0, myClassImpl.myFunc{ i => i - i })
    Assert.isTrue(myClassImpl.myFunc is ((Int64)->Int64) -> Int64)

    var myStructImpl = myStruct()
    Assert.equals(1, myStructImpl.myFunc({ i => i / i }))
    Assert.equals(1, myStructImpl.myFunc(){ i => i / i })
    Assert.equals(1, myStructImpl.myFunc{ i => i / i })
    Assert.isTrue(myStructImpl.myFunc is ((Int64)->Int64) -> Int64)

    Assert.equals(false, myEnum.T.myFunc({ i => !i }))
    Assert.equals(false, myEnum.T.myFunc(){ i => !i })
    Assert.equals(false, myEnum.T.myFunc{ i => !i })
    Assert.isTrue(myEnum.T.myFunc is ((Bool)->Bool) -> Bool)
}
