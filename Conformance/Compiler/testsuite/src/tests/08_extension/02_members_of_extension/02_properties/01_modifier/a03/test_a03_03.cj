/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a03_03

  @Level:         1

  @Assertion:       8.2.2.1(3) A property modified with protected is not only accessible within the package, but 
                    also to subclasses of the current class in other packages.

  @Description:     Check that property can't be defined inside struct extensions with protected modifier.

  @Mode:            compileonly

  @Negative:        no

  @Structure:       single

  @Issue:           6124

*/

struct MyStruct {}

extend MyStruct {
    protected prop p1: Int64 { 
        get() { 2 }
    }
}

main(): Unit { }
