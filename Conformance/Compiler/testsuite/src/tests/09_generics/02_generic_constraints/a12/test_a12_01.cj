/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a12_01

  @Level:         1

  @Assertion: 9.2(12) For example, the following shows how generic constraints are declared. 

              interface Enumerable<U> where U <: Bounded {...} 

              interface Comparable<T> {...} 

              func collectionCompare<T>(a: T, b: T) where T <: Comparable<T> & Seqence {...} 

              func sort<T, V>(input: T) 
                      where T <:  Enumerable<V>, V <: Object {...} 

  @Description: Check specified declarations.

  @Mode: compileonly

  @Negative: no

*/

interface Bounded {}

interface Enumerable<U> where U <: Bounded {}

interface Comparable<T> {}

interface Sequence {}

func collectionCompare<T>(a: T, b: T) where T <: Comparable<T> & Sequence {}

func sort<T, V>(input: T) 
        where T <:  Enumerable<V>, V <: Object {}

main() {
}

