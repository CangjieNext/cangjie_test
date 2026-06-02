/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a11_02

  @Level:         1

  @Assertion:     5.1.4(11) Note that the return value of a function has the semantics that defined by let. 

  @Description:   Check that function return value can not be changed:
                  in class constructor

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
class myClass {
    myClass(in_val:String) {
        this.myClassFunc(12.4) = in_val
    }
    func myClassFunc(in_val:Float32): String {
        in_val.toString()
    }
} 
main() {
}
