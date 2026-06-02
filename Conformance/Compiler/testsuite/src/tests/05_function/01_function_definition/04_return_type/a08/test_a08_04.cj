/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_04_a08_04

  @Level:         1

  @Assertion:       5.1.4(8) If the return type of a function is not specified, the compiler will jointly derive the 
                    return type of the function based on the type of the function body and all return expressions in 
                    the function body. 
                    This process is not complete; for example, the compiler will raise an error if asked to infer the 
                    return types of (mutually) recursive functions.
                    (Note: It is not possible to derive the return type for a function that does not have a function 
                    body.) 

  @Description:     Check that abstract function must have return type.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

interface myInterface {
    func f()
}

main() {
}
