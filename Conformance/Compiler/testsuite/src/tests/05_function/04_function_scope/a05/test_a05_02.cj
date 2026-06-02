/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_04_a05_02

  @Level:         1

  @Assertion:       5.4(5) As shown in the following example, the function nestedFunction is a nested function and 
                    Its scope starts from the definition and ends at the end of the globalFunction function body. 
                    func globalFunction() { 
                        func nestedFunction() {} 
                    }

  @Description:     Check that nested function from example is not accesible outside globalFunction.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

func globalFunction() { 
    func nestedFunction() {} 
}

main() {
    nestedFunction()
}
