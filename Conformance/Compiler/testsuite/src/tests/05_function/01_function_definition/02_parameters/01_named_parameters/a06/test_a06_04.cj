/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_01_a06_04

  @Level:         1

  @Assertion:     5.1.2.1(6) If an abstract function or open-modified function has named formal parameters, then an 
                  implementation function or override-modified function needs to keep the same named formal parameters. 

  @Description:   Check that implementation of open function with the other named formal parameters will produce an 
                  error.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

open class myOpenClass { 
  public open func f(a!: Int32, c!: Int32 ): Int32 { 
    return a + c 
  } 
} 

class myClass0 <: myOpenClass { 
  public override func f(x!: Int32, z!: Int32 ) : Int32 { 
    z - c 
  } 
}

main() {
}
