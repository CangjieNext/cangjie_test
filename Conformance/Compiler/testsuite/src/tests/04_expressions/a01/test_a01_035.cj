/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_035

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that expression cannot consist of two function invocations.
  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

func f1(): Int64 {
    0
}

func f2(): Int64 {
    1
}

main() { 
    f1() f2()
    return
}
