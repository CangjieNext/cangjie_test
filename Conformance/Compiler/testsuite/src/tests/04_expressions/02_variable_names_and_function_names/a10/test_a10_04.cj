/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_02_a10_04

  @Level:         1

  @Assertion: 4.2(10) If a function is overloaded in current scope, no matter
              it is a generic function or not, it is ambigous to use its
              function name as an expression. 
  @Description: Checks that generic overloaded function name cannot be used as 
                an expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

class A {
}

func empty<T1, T2, T3>(a: Int32, b: Int32, c: Int32) { 
}

func empty<T1, T2, T3>(t1: T1, t2: T2, t3: T3) where T1 <: A { 
}

main() {
    var f = empty<A, String, Int32> 
}
