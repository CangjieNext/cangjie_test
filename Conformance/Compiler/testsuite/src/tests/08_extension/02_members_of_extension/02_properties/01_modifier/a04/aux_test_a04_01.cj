/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Defines a package pkg1 for test.

  @Structure:       complex-aux
*/

package pkg1

public type MyType = (String, Rune)

extend MyType {
    prop p: Bool { 
        get() { true }
    }
}

public class MyClass {}

extend MyClass {
    prop p: Int64 { 
        get() { 1 }
    }
}

public struct MyStruct {}

extend MyStruct {
    prop p: Int64 { 
        get() { 2 }
    }
}

public enum MyEnum { A }

extend MyEnum {
    prop p: Rune { 
        get() { 'f' }
    }
}
