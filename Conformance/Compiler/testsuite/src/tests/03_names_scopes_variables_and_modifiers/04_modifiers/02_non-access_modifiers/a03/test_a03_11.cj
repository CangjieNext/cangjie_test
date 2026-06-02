/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a03_11

  @Level:         1

  @Assertion:    3.4.2(3) override means overriding a member of the parent class, See class for details

  @Description:  Check that constructor cannot be overriden

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

open class C1 {
    var balance: Int64

    init(p: Int64) {
        balance = p
    }

    init() {
        balance = 10
    }
}

class C2 <: C1 {
    override init(p: Int64) {
        balance = p + p
    }
}

main() {
    return 0
}
