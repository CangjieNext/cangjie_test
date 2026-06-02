// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// LEVEL: 0
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

@Annotation[target: [Type]]
public class Anno {
    public const init() {}
}

@Anno
public interface IA {}

@Anno
public abstract class IB {
    @Anno
    func sayHi(): Unit

    func setA(@Anno a: Int64): Unit

    @Anno
    prop a: Int64
}

main() {
    0
}

/* SCAN
error: the visibility of an 'abstract' function must be 'public' or 'protected'
  ==> testAnno01.cj:22:10:
   | 
22 |     func sayHi(): Unit
   |          ^^^^^ 
   | 

error: the visibility of an 'abstract' function must be 'public' or 'protected'
  ==> testAnno01.cj:24:10:
   | 
24 |     func setA(@Anno a: Int64): Unit
   |          ^^^^ 
   | 

error: the visibility of an 'abstract' property must be 'public' or 'protected'
  ==> testAnno01.cj:27:10:
   | 
27 |     prop a: Int64
   |          ^ 
   | 

3 errors generated, 3 errors printed.
*/