/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a08_01

  @Level:         1

  @Assertion: 5.6(8) Note that capture is transitive. If function g captures any mutable variable, and function f 
              invokes the function g, and some of the var variables captured by g are not defined in the f function, 
              then f also captured mutable variables

  @Description: Check that f captures mutable variables transitively. Ensure it by checking that f is not a first-class
                citizen.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    var x = 3 // Mutable variable.

    func f() {

        func g() {
            // g explicitely captures mutable variable
            x * 2
        }
    
        // f captures mutable variable 'x' transitively by calling 'g'.
        // Thus, f is not a first-class citizen.
        g()
    }

    var foo = f  // f is not allowed to be assigned to a variable as not first-class citizen.

    return
}

