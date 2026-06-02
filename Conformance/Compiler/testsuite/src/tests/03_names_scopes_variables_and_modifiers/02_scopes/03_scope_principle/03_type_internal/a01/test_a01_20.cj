/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_03_a01_20

  @Level:         1

  @Assertion:    3.2.3.3(1) The scope of classes/interface/struct’s members is the entire class/interface/struct
                  definition.

  @Description:  Check that struct's inherited functions cannot be accessible struct definition.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

interface I {
    mut func addToSum(p: Int64): Unit
}

struct S <: I {
    var sum: Int64 = 0
    public mut func addToSum(p: Int64): Unit {
        sum += 1
    }
}

main() {
    var obj = S()
    addToSum(1)
}