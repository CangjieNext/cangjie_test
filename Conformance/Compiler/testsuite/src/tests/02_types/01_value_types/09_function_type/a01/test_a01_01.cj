/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_09_a01_01

  @Level:         1

  @Assertion:   2.1.9(1) The function type is immutable and is the type of functions.

  @Description: Checks that the function type (e.g. '(Int32) -> Int32') is immutable,
                namely, it is not allowed to assign the new value to a function identifier.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

func testFunc1(param: Int32): Int32 {
    return param;
}

func testFunc2(param: Int32): Int32 {
    return param + 1;
}

main() {
    testFunc1 = testFunc2;
    return 0;
}
