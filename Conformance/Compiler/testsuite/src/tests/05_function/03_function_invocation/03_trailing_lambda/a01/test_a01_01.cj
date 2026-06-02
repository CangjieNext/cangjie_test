/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_03_a01_01

  @Level:         1

  @Assertion:       5.3.3(1) When the last real parameter of a function call is a lambda, we can use the trailing 
                    closure syntax to place the lambda at the end of the function call, outside of brackets. 

  @Description:     Check that trailing closure syntax is allowed when the last real parameter of a function call is 
                    a lambda.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func myFunc0(a: Int64, fn: (Int64)->Int64) { fn(a) } 
    func myFunc1(fn: (Int64)->Int64) { fn(3) } 
}

struct myStruct {
    func myFunc0(a: Int64, fn: (Int64)->Int64) { fn(a) } 
    func myFunc1(fn: (Int64)->Int64) { fn(3) } 
}

enum myEnum {
    T

    func myFunc0(a: Int64, fn: (Int64)->String) { fn(a) } 
    func myFunc1(fn: (Bool)->Bool) { fn(true) } 
}

func myFunc0(a: Int64, fn: (Int64)->Int64) { fn(a) } 
func myFunc1(fn: (Int64)->Int64) { fn(3) } 

main() {
    Assert.equals(1, myFunc0(1, { i => i * i }))
    Assert.equals(1, myFunc0(1){ i => i * i })
    Assert.isTrue(myFunc0 is (Int64, (Int64)->Int64) -> Int64)
    Assert.equals(6, myFunc1({ i => i + i }))
    Assert.equals(6, myFunc1(){ i => i + i })
    Assert.isTrue(myFunc1 is ((Int64)->Int64) -> Int64)

    var myClassImpl = myClass()
    Assert.equals(1, myClassImpl.myFunc0(44, { i => i / i }))
    Assert.equals(1, myClassImpl.myFunc0(44){ i => i / i })
    Assert.isTrue(myClassImpl.myFunc0 is (Int64, (Int64)->Int64) -> Int64)
    Assert.equals(0, myClassImpl.myFunc1({ i => i - i }))
    Assert.equals(0, myClassImpl.myFunc1(){ i => i - i })
    Assert.isTrue(myClassImpl.myFunc1 is ((Int64)->Int64) -> Int64)

    var myStructImpl = myStruct()
    Assert.equals(16, myStructImpl.myFunc0(4, { i => i * i }))
    Assert.equals(16, myStructImpl.myFunc0(4){ i => i * i })
    Assert.isTrue(myStructImpl.myFunc0 is (Int64, (Int64)->Int64) -> Int64)
    Assert.equals(1, myStructImpl.myFunc1({ i => i / i }))
    Assert.equals(1, myStructImpl.myFunc1(){ i => i / i })
    Assert.isTrue(myStructImpl.myFunc1 is ((Int64)->Int64) -> Int64)

    Assert.equals("4", myEnum.T.myFunc0(4, { i => "${i}" }))
    Assert.equals("4", myEnum.T.myFunc0(4){ i => "${i}" })
    Assert.isTrue(myEnum.T.myFunc0 is (Int64, (Int64)->String) -> String)
    Assert.equals(false, myEnum.T.myFunc1({ i => !i }))
    Assert.equals(false, myEnum.T.myFunc1(){ i => !i })
    Assert.isTrue(myEnum.T.myFunc1 is ((Bool)->Bool) -> Bool)
}
