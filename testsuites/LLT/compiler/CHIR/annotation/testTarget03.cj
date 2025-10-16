// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

const func myTarget(x: Int64) {
    match (x) {
        case 0 => Type
        case 1 => Parameter
        case 2 => Init
        case 3 => MemberProperty
        case 4 => MemberFunction
        case _ => MemberVariable
    }
}

@Annotation[target: [MemberProperty, myTarget(1)]]
public class A {
    const init() {}
}

@A
class B {}

@A
interface C {}

@A
struct D {}

@A
enum E {x}

main() {}

/* SCAN
error: '@A' not applicable to type
  ==> testTarget03.cj:20:1:
   | 
20 | @A
   | ^^ 
   | 

error: '@A' not applicable to type
  ==> testTarget03.cj:23:1:
   | 
23 | @A
   | ^^ 
   | 

error: '@A' not applicable to type
  ==> testTarget03.cj:26:1:
   | 
26 | @A
   | ^^ 
   | 

error: '@A' not applicable to type
  ==> testTarget03.cj:29:1:
   | 
29 | @A
   | ^^ 
   | 

4 errors generated, 4 errors printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
