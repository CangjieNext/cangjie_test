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

@Annotation[target: [(MemberVariable, myTarget(2))[0]]]
public class A {
    const init() {}
}

@A
class B {}

main() {}

/* SCAN
error: '@A' not applicable to type
  ==> testTarget02.cj:20:1:
   | 
20 | @A
   | ^^ 
   | 

1 error generated, 1 error printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
