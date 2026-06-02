/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_09_a07_02

  @Level:         1

  @Assertion:  2.1.9(7) Function types do not support using == (!=) for equality (inequality) comparison.

  @Description: Checks that the try to compare (using '!=') two variables of function type
                causes compilation error;

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

type funcType = () -> Int32;

func testFunc1(): Int32 {
    return 1i32;
}

func testFunc2(): Int32 {
    return 2i32;
}

main() {
    let funcVar1: funcType = testFunc1;
    let funcVar2: funcType = testFunc2;
    let isEqual: Bool = funcVar1 != funcVar2;

    return 0;
}

