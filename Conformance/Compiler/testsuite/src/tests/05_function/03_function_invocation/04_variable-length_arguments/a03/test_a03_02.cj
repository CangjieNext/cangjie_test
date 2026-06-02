/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a03_02

  @Level:         1

  @Assertion:       5.3.4(3) 2.Variable-length arguments can be used to pass elements of an array one by one in the 
                    form of a normal argument list when the function is called.

  @Description:     Check that non-last non-named Array type parameter is not variable-length and not allow to pass 
                    elements of an array one by one when function called: class member function.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class myClass {
    func myFunc(arr: Array <Rune>, a: Rune): String { 
        if(arr.size == 0) {
            return "${a} + 0" 
        }
        return "${a} + ${arr[arr.size-1]}" 
    }
}

main() {
    var myClassImpl = myClass()
    myClassImpl.myFunc('d', ['1', 'h', 'R'])
    0
}
