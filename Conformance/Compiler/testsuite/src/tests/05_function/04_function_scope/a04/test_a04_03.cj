/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a04_03

  @Level:         1

  @Assertion:       5.4(4) • Nested functions 
                    A function declared in a function body is a nested function. Its scope is local, for details, see 
                    Scopes. i.e., it is accessible only with the function body.                          

  @Description:     Check that nested function can't be accesed outside parent function: from another global function
                    defined before parent.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issue:           6273

*/

func testFunc() {
    nestedFunc()
}

func globalFunction() {
    func nestedFunc(): String { "TTT" }
} 

main() {
}
