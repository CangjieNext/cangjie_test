
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a10_01

  @Level:         1

  @Assertion:   4.7(10) As for the example below, the break expression appears inside the function f and hence is not
                within the loop body of the outer while loop; similarly, the continue expression appears inside a
                lambda expression and hence is not within the loop body of the outer while loop.
                while (true) { 
                    func f() {
                        break // Error: break must be used directly inside a loop
                    }
                    let g = { =>
                        continue // Error: continue must be used directly inside a loop
                    }
                }
  @Description: Checks that break not directly inside a loop is not allowed.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore

*/

main() {
    while (true) { 
        func f() {
            break // Error: break must be used directly inside a loop
        }
    }
}
