/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a07_03

  @Level:         1

  @Assertion: 5.6(7) Capturing variables declared by var: The function or lambda that captures mutable variables can 
              only be invoked and cannot be used as a first-class citizen, including cannot be assigned to a variable, 
              cannot be used as an argument or return value, cannot be used as an expression. 

  @Description: Check that function or lambda that captures mutable variables can not be used as first-class citizen.
                Check that such function can not be used as an argument.

  @Mode: compileonly

  @Negative: yes

*/

func callMe(fn: () -> Int64) {
    fn()
}

func foo() {
    var x = 3

    func f() {
        x * 2
    }

    return callMe(f)
}

main() {}

