/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a03_12

  @Level:         1

  @Assertion:    3.4.2(3) override means overriding a member of the parent class, See class for details

  @Description:  Check that generic functions can have override modifier

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single
*/

open class C1 {
    open public func foo<T>(a: T, b: T) {
        return a
    }
}

class C2 <: C1 {
    override public func foo<T>(a: T, b: T) {
        return b
    }
}

main() {
    var obj = C2()
}
