/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a03_01

  @Level:         1

  @Assertion:       5.7.1(3) – Constructors defined within a class or struct, including primary constructor and init 
                    constructors. 

  @Description:     Check that constructors defined within a class or struct, including primary constructor and init 
                    constructors, allow overload

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    var myVar: Rune = r'A'
    init(name: String, age: Int32, gender: Int32) { 
        this(name, age, true, r'U')
        this.myVar = r'D'
    }
    init(name: String, age: Int32, gender: Rune)  { 
        this(name, age, false, r'U')
        this.myVar = r'C'
    }
    init(name: String, age: Int32, gender: Bool) { 
        this(name, age, false, r'U') 
        this.myVar = r'E'
    }
    myClass(name: String, age: Int32, gender: Bool, status: Rune) {
        this.myVar = r'B'
    }
}

struct myStruct {
    var myVar: Int32 = 0
    init(name: String, age: Int32, gender: Int32) { 
        this(name, age, true, r'U')
        this.myVar = 4
    }
    init(name: String, age: Int32, gender: Rune)  { 
        this(name, age, false, r'U')
        this.myVar = 3
    }
    init(name: String, age: Int32, gender: Bool) { 
        this(name, age, false, r'U') 
        this.myVar = 2
    }
    myStruct(name: String, age: Int32, gender: Bool, status: Rune) {
        this.myVar = 1
    }
}

main() {
    var myClassImpl0 = myClass("AAA",23,true,r'D')
    Assert.equals(r'B', myClassImpl0.myVar)
    var myClassImpl1 = myClass("AAA",23,true)
    Assert.equals(r'E', myClassImpl1.myVar)
    var myClassImpl2 = myClass("AAA",23,r'M')
    Assert.equals(r'C', myClassImpl2.myVar)
    var myClassImpl3 = myClass("AAA",23,10)
    Assert.equals(r'D', myClassImpl3.myVar)

    var myStructImpl0 = myStruct("AAA",23,true,r'D')
    Assert.equals(1, myStructImpl0.myVar)
    var myStructImpl1 = myStruct("AAA",23,true)
    Assert.equals(2, myStructImpl1.myVar)
    var myStructImpl2 = myStruct("AAA",23,r'M')
    Assert.equals(3, myStructImpl2.myVar)
    var myStructImpl3 = myStruct("AAA",23,10)
    Assert.equals(4, myStructImpl3.myVar)

}
