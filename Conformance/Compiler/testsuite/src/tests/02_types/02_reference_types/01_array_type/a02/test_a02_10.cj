/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_a02_10

  @Level:         1
  @Assertion:    2.2.1(2) Arrays are used to store a sequence of values of the
                 same type (or has a common super type).

  @Description:  Checks that value can't be added to array in case values has
                 no common super type

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    complex-main
  @Dependencies: ../array_commons.cj

*/
import array_commons.*

class C4 {
}

main(): Int64 {
    let a1 = Array<I>(10){ i =>
        match (i % 3) {
            case 0 => C1()
            case 1 => C2()
            case _ => C3()
        }
    }
    a1[0] = C4()

    return 0
}
