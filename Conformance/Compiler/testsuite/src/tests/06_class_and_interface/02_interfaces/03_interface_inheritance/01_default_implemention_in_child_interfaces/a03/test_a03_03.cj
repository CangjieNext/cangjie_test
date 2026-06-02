/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_01_a03_03

  @Level:         1

  @Assertion: 6.2.3.1(3)
              If a subinterface inherits a function or property
              that has a default implementation in the superinterface,
              it is not allowed to give only the declaration of this function or property
              but without definition in the subinterface

  @Description: Check that a subinterface can not declare a static function
                that has a default implementation in the superinterface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    static func f() {}
}

interface J <: I {
    static func f(): Unit
}

main() {
}