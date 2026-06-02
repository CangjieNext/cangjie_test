/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_02_a05_01

  @Level:         1

  @Assertion:    10.1.3.2(5) Step 2: Compare the parameters of the two matches to determine which is better.
                 For two matching items, f_i and f_j, if the following conditions are met,
                 f_i is more matched than f_j:
                 For a function call expression e<T1, ..., T_p>(e_1, ..., e_m, a_m+1:e_m+1, a_k:e_k),
                 if the number of arguments is k, the number of parameters used 
                 for overloading resolution is k.
                 The parameters for f_i and f_j are (a_i1, ..., a_ik) and (a_j1, ..., a_jk) respectively.
                 The types of parameters are (A_i1, ..., A_ik) and (A_j1, ..., A_jk).
                 If (a_i1, ..., a_ik) of f_i is forwarded as arguments to f_j, the type checking can be passed, 
                 and (a_j1, ..., a_jk) of f_j is forwarded as arguments to f_i, the type checking failed , then, 
                 we consider that f_i is better matched than f_j. As the following:
                 func f_i<X1,..., Xp>(a_i1: A_i1,..., a_ik: A_ik) {// f_i may not have type parameters
                  f_j(a_i1, ..., a_ik)     // If this call expression can pass the type checking
                 }
                 func f_j<X1,..., Xq>(a_j1: A_j1,..., a_jk: A_jk) {// f_j may not have type parameters
                   f_i(a_i1, ..., a_ik) // And this expression cannot pass the type checking
                 }
  
  @Description:  Emiit error as call f_j and decl f_j have different argument types
                 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

class A_i1  {}
class A_i2  {}
class A_i3  {}
class A_i4  {}
class A_i5  {}


class A_j1  {}
class A_j2  {}
class A_j3  {}
class A_j4  {}
class A_j5  {}


func f_i<X1, X2, Xp>(a_i1: A_i1, a_i2:A_i2,a_i3: A_i3, a_i4:A_i4, a_i5: A_i5) {// f_i may not have type parameters
    f_j<X1, X2, Xp>(a_i1, a_i2, a_i3, a_i4, a_i5)     // If this call expression can pass the type checking
}
func f_j<X1, X2, Xq>(a_j1: A_j1, a_j2:A_j2,a_j3: A_j3, a_j4:A_j4, a_j5: A_j5) {// f_j may not have type parameters
}

main() {
}