/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a09_05

  @Level:         1

  @Assertion:    3.4.2(9) operator indicates that the function is an operator overload function, See Operator
                 Overloading for details

  @Description:  Check that only one operator can be used with `operator func`.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

class Store {
    var localp = 0
    var foreignp = 0

    init(p: Int64) {
        localp = p
        foreignp = p + p / 10
    }

    init(p1: Int64, p2: Int64) {
        localp = p1
        foreignp = p2
    }

    operator func !-!(p: Int64): Store {
        return Store(localp - p, foreignp - p)
    }
}

main() {
    return 0
}
