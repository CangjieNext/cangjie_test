/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_05_a03_03

  @Level:         1

  @Assertion:       8.5(3) Note that if a member is extended in the parent class, it cannot be defined again in the 
                    child class with the same name due to inheritance rules, and it cannot be overridden or 
                    reimplemented(allow function overloading).

  @Description:     Check that members defined in class extension can't be redefined in subclass.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

open class MyOpenClass {
    var myVar: Int64 = 10
}

extend MyOpenClass {
    public static func myStaticFunc() {"AAA"}
}

class MyClass <: MyOpenClass {
    public static redef func myStaticFunc() {"AAA"}
}

main() {
}
