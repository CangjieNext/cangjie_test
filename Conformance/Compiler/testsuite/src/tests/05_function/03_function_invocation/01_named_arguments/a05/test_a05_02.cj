/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_01_a05_02

  @Level:         1

  @Assertion:       5.3.1(5) When a function is invoked, positional arguments are not allowed after the named 
                    arguments. Otherwise, a compile error is reported. 

  @Description:     Check that function with unnamed and named parameters can't be invoked with wrong order of 
                    arguments: named bw positional.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/
class myClass {

    func f1(x: String, y: String, z!: Bool): String { 
        if(z) {
            return x
        }
        return y 
    } 

}


main() {
    var myClassImpl = myClass()
    var myRet = myClassImpl.f1("AAA", z: true, "FFF")
}
