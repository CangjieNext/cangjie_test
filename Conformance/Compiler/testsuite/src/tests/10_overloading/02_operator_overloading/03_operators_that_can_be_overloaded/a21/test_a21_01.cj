
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        10_02_03_a21_01

  @Level:         1

  @Assertion:   10.2.3(21)
                // Scenario for `this` or `super`. 
                open class A { 
                    init(x: Int64) { 
                        this() // error, missing argument for call with parameter list: (Int64) 
                    } 
                    operator func ()(): Unit {} 
                } 

                class B <: A { 
                    init() { 
                        super() // error, missing argument for call with parameter list: (Int64) 
                    } 
                } 

                // Scenario for enum constructor. 
                enum E { 
                    Y | X | X(Int64) 
                    operator func ()(a: Int64){a} 
                    operator func ()(a: Float64){a} 
                } 

                main() { 
                    let e = X(1) // ok, X(1) is to call the constructor X(Int64). 
                    X(1.0)     // ok, X(1.0) is to call the operator () overloading function. 
                    let e1 = X 
                    e1(1) // ok, e1(1) is to call the operator () overloading function. 
                    Y(1) // oK, Y(1) is to call the operator () overloading function. 
                }
  @Description: Checks the given example (`this` case).
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

// Scenario for `this` or `super`. 
open class A { 
    init(x: Int64) { 
        this() // error, missing argument for call with parameter list: (Int64) 
    } 
    operator func ()(): Unit {} 
} 

main() { }
