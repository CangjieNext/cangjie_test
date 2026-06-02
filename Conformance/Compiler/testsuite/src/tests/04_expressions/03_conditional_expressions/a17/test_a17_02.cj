/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a17_02

  @Level:         1

  @Assertion: 4.3(17)  Examples:

    struct S1 { }
    struct S2 { }

    interface I1 {} 
    class C1 <: I1 {} 
    class C2 <: I1 {}

    interface I2{} 
    class D1 <: I1 & I2 
    class D2 <: I1 & I2
 
    func test12() {
        if (true) { // OK. The type of this if expression is Unit.
            S1()
        } else {
            S2()
        }

        if (true) { // OK. The type of this if expression is Unit.
            C1()
        } else {
            C2()
        }

        return if (true) { // Error. The `if` expression is returned. 
                           // There is no least common supertype of `D1` and `D2`.
            D1()
        } else {
            D2()
        }
    }

  @Description: Checks example from the Spec (negative test case).
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore
  @Issue: 0006394

*/

interface I1 {} 
interface I2{} 

class D1 <: I1 & I2 {}
class D2 <: I1 & I2 {}
 
func test12() {
    return if (true) { 
        // Error. The `if` expression is returned. 
        // There is no least common supertype of `D1` and `D2`.
        D1()
    } else {
        D2()
    }
}

main() { 
}
