/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a04_02

  @Level:         1

  @Assertion:       5.3.4(4) 3.Only the last position of the non-named parameter can use variable-length argument.

  @Description:     Check that if the after non-named parameter is of Arraytype present at least one non-named, the 
                    function can't be called using syntax sugar: class member function.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class myClass {
    func f0(arr: Array<Rune>, a: Bool): String { "f0" }
}

main() {
    var myClassImpl = myClass()
    myClassImpl.f0('d', true)
    0
}
