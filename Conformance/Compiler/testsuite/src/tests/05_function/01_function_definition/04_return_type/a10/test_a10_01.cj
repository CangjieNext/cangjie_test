/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a10_01

  @Level:         1

  @Assertion:     5.1.4(10) Here is an example: 
                  class Base { } 
                  class Child <: Base { } 
                  func f(a: char) { 
                    if (false) { 
                      return Base() 
                    } 
                    return Child() 
                  } 
                  The type of the function body is the type of the last item of the block, i.e. the type of return 
                  Child(), which is of type Nothing. 
                  The type of e in the first return e expression, i.e. return Base(), is Base. 
                  The type of e in the second return e expression, i.e. return Child(), is Child. 
                  Since the lease common super type of Nothing, Base, Child is Base, the return type of the function 
                  is Base.

  @Description:   Positive example from the spec.

  @Mode:          run

  @Negative:      no

  @Structure:     single

  @CompileWarning: ignore

  @Issue:          6242

*/
import utils.assert.Assert

open class Base { } 

class Child <: Base { } 

func f(a: Rune) { 
  if (false) { 
    return Base() 
  } 
  return Child() 
} 

main() {
  Assert.isTrue(f(r'c') is Base)
}
