/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a01_01

  @Level:         1

  @Assertion:       5.4 (1) Functions can be declared at the top level or within other functions. 

  @Description:     Check that function can be defined at the top level or within other functions. 

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6281

*/
import utils.assert.Assert

let myTopLevelFloatLet: Float32 = 13.8

class myClass {
    public var myPublicVar: Int32 = 10

    myClass(a: Int32) {
        func nestedFunc(a: Int32): Int32 { a + 1 }
        this.myPublicVar = nestedFunc(a)
    }

    func myPublicFunc() {
        func nestedFunc(): Int32 { this.myPublicVar * 10 }
        return nestedFunc()
    }
}

struct myStruct {

    static func myStaticFunc() {
        func nestedFunc(): String { "nested func" }
        return "parent and ${nestedFunc()} parts"
    }

    func myPublicFunc() {
        var myLocalVar: Int32 = 12
        func nestedFunc(): Int32 { myLocalVar * 10 }
        return nestedFunc()
    }
}

enum myEnum {
    V

    func myFunc(): Float32 {
        func nestedFunc(): Float32 { myTopLevelFloatLet }
        return nestedFunc()
    }
}

func globalFunction() {} 

func parentFunc(a: Int32): Int32 {
    func nestedFunc(a: Int32): Int32 { a + 1 }
    return nestedFunc(a)
}

main() {
    Assert.isTrue(globalFunction is () -> Unit)

    Assert.isTrue(parentFunc is (Int32) -> Int32)
    Assert.equals(12, parentFunc(11))

    var myClassImpl = myClass(3)
    Assert.equals(4, myClassImpl.myPublicVar)
    Assert.equals(40, myClassImpl.myPublicFunc())

    Assert.equals("parent and nested func parts", myStruct.myStaticFunc())
    var myStructImpl = myStruct()
    Assert.equals(120, myStructImpl.myPublicFunc())

    Assert.equals(myTopLevelFloatLet, myEnum.V.myFunc())

}
