/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_03_a07_05

  @Level:         1

  @Assertion:       5.3.3(7) Note that the trailing closure syntax can only be used on function calls with 
                    function/variable names, and that the lambda expression of a trailing closure will only be 
                    interpreted as the last argument of the function corresponding to the function/variable name.

  @Description:     Check that the trailing closure syntax can't be used on function calls when lambda is not last 
                    argument of the function: global function as variable.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

func myFunc(fn: (Int64)->Int64, a: Int64) { fn(a) } 

main() {
    var vFunc = myFunc
    vFunc(1){ i => i + i }
}
