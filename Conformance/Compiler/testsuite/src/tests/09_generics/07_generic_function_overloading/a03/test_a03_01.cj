/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_07_a03_01

  @Level:         1

  @Assertion: 9.7(3) If the unique argument type cannot be determined, an error is reported. 

  @Description: Check that undetermined argument type causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

func foo<T>(x: T, y: Int64) {
    return 1
}

func foo(x: Float32, y: String) {
    return 2
}

func foo<T>(x: T, y: T) {
    return 3
}

main() {
    // Can not determine argument type.
    foo(42, "hello world")
}

