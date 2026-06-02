/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_a05_01

  @Level:         1
   @Assertion:   2.1.7(5) If each TypeK in (Type1, Type2, ..., TypeN) supports equality (inequality)
                 comparison == (!=) , the tuple type (Type1, Type2, ..., TypeN) supports == (!=);
                 otherwise, it does not support == (!=), and a compilation error will be reported
                 when == (!=) is used.
   @Description: Check that tuple can be compared if internal type can be compared.
   @Mode:        run
   @Negative:    no
   @CompileWarning: Ignore
   @Structure:   single
 */

import utils.assert.Assert

main() {
    var t1: (Int64, String) = (54, "Privet")
    var t2: (Int64, String) = (65, "Chao")
    Assert.isTrue((54, "Privet") == t1)
    Assert.isTrue(t1 != t2)

    let t3: (Float16, Bool) = (3.14, true)
    let t4: (Float16, Bool) = (2.7, false)
    Assert.isTrue((3.14, true) == t3)
    Assert.isTrue(t3 != t4)

    var t5: (Rune, (Int16, Int64)) = (r'y', (-54, 64))
    var t6: (Rune, (Int16, Int64)) = (r'n', (64, -64))
    Assert.isTrue((r'y', (-54, 64)) == t5)
    Assert.isTrue(t5 != (r'n', (64, -64)))

    let t7: (Unit, Range<Int64>) = ((), 6..1 : -1)
    Assert.isTrue(((), 6..1 : -1) == t7)
    Assert.isTrue(t7 != ((), 2..10 : 2))

    return 0
}
