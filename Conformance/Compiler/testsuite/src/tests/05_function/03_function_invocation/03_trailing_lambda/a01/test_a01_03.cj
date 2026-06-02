/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_03_a01_03

  @Level:         1

  @Assertion:       5.3.3(1) When the last real parameter of a function call is a lambda, we can use the trailing 
                    closure syntax to place the lambda at the end of the function call, outside of brackets. 

  @Description:     Check that trailing closure syntax is not allowed when the lambda is not a last real parameter of 
                    a function call: struct member function.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct myStruct {
    func myFunc(fn: (Int64)->Int64, a: Int64 ) { fn(a) } 
}

main() {
    var myStructImpl = myStruct()
    myStructImpl.myFunc(44){ i => i / i }
}
