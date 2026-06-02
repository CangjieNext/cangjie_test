/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_a03_02

  @Level:         1

  @Assertion:     5.1.2(3)
    func bar(a: Int64 , b!: Float64 = 1.0, s!: String) {}        // OK 
    func bar2(a: Int64 = 1, b!: Float64 = 1.0, s: String = "Hello") {}         // Error 
    func foo(a: Int64, b: Float64)(s: String = "Hello") {}       // Error 
    
    func f1(a:Int64 ,_:Int64 ):Int64 {
      return a+1
    }
    
    func f2(_:String) :Unit {
      print( "Hello Cangjie" )
    }
  
  @Description:   Negative test from the Spec (part 1).

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func bar2(a: Int64 = 1, b!: Float64 = 1.0, s: String = "Hello") {}         // Error 

main() {
}
