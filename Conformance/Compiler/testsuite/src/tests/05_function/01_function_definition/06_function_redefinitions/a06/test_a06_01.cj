/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_06_a06_01

  @Level:         1

  @Assertion:       5.1.6(6) Examples: 
                    1.The following two functions constitute redefinitions because there exists a renaming [T1 |-> T2]
                    (onto the first function) such that the non-generic parts of the two functions constitute 
                    redefinitions.
                    func f<T1>(a:T1) {}
                    func f<T2>(b:T2) {} 

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

func f<T1>(a:T1) {}
func f<T2>(b:T2) {} 

main() {
}
