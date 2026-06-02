/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a02_01

  @Level:         1

  @Assertion:       5.4(2) • Global functions 
                    A function that is declared at the top level is called a global function. Its scope is global, 
                    i.e., it is accessible globally. 

  @Description:     Check that function defined on top-level is global and is accessible globally.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6281

*/
import utils.assert.Assert

class myClass {
    func myClassFunc() {
        globalFunction("myClassFunc")
    }
}

struct myStruct {
    func myStructFunc() {
        globalFunction("myStructFunc")
    }
}

enum myEnum {
    R

    func myEnumFunc() {
        globalFunction("myEnumFunc")
    }
}

func globalFunction(a: String): String { "requested from ${a}" }  

func testFunc(): String {
    return globalFunction("testFunc")
}

main() {
    Assert.isTrue(globalFunction is (String) -> String)
    Assert.equals("requested from main method",globalFunction("main method"))
    Assert.equals("requested from testFunc",testFunc())

    var myClassImpl = myClass()
    Assert.equals("requested from myClassFunc",myClassImpl.myClassFunc())

    var myStructImpl = myStruct()
    Assert.equals("requested from myStructFunc",myStructImpl.myStructFunc())

    Assert.equals("requested from myEnumFunc",myEnum.R.myEnumFunc())
}
