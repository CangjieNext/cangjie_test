/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a04_01

  @Level:         1

  @Assertion:       5.4(4) • Nested functions 
                    A function declared in a function body is a nested function. Its scope is local, for details, see 
                    Scopes. i.e., it is accessible only with the function body.                          

  @Description:     Check that nested function can be defined inside any defined functions

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6273

*/
import utils.assert.Assert

interface myInterface {
    static func myIFunc() {
        func nestedFunction() {
            "nested function from static interface function"
        }
        nestedFunction()
    }
}

class myClass {
    static func myStaticFunc() {
        func nestedFunction() {
            "nested function from static class function"
        }
        nestedFunction()
    }

    func myFunc() {
        func nestedFunction() {
            "nested function from class function"
        }
        nestedFunction()
    }

}

struct myStruct {
    static func myStaticFunc() {
        func nestedFunction() {
            "nested function from static struct function"
        }
        nestedFunction()
    }

    func myFunc() {
        func nestedFunction() {
            "nested function from struct function"
        }
        nestedFunction()
    }

}

enum myEnum {
    E

    func myFunc() {
        func nestedFunction() {
            "nested function from enum function"
        }
        nestedFunction()
    }

}

func globalFunction() {
    func nestedFunction() {
        "nested function from global function"
    }
    nestedFunction()
} 

main() {
    Assert.equals("nested function from global function", globalFunction())

    Assert.equals("nested function from static interface function", myInterface.myIFunc())
    Assert.equals("nested function from static class function", myClass.myStaticFunc())
    Assert.equals("nested function from static struct function", myStruct.myStaticFunc())

    Assert.equals("nested function from enum function", myEnum.E.myFunc())

    var myClassImpl = myClass()
    Assert.equals("nested function from class function", myClassImpl.myFunc())

    var myStructImpl = myStruct()
    Assert.equals("nested function from struct function", myStructImpl.myFunc())
}
