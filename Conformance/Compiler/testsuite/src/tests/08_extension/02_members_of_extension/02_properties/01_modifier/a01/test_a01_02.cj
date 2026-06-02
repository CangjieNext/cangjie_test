/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a01_02

  @Level:         1

  @Assertion:       8.2.2.1(1) Properties definitions within extensions support the private, protected (only can be 
                    used when the extended type is a class type) or public modifier.

  @Description:     Check that propertiy can't be defined inside struct extensions with protected modifier.

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
