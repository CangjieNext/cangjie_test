/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_10_a01_01

  @Level:         1
  @Assertion:   A.2.3.10(1)
                annotationList: annotation+;
                annotation
                    : AT (identifier NL* DOT)* identifier (LSQUARE NL* annotationArgumentList NL* RSQUARE)?
                    ;
                annotationArgumentList
                    : annotationArgument (NL* COMMA NL* annotationArgument)* NL* COMMA?
                    ;
                annotationArgument
                    : identifier NL* COLON NL* expression
                    | expression
                    ;

  @Description: Check some annotation declarations and usages.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   complex-main
  @Dependencies: aux_01.cj
  @Issue:       6622
*/

import aux_01

// declare custom annotations
@Annotation
public class MyAnn1 {
    let name: String
    let version: Int64
    public const init(name: String, version!: Int64 = 0) {
        this.name = name
        this.version = version
    }
}

@Annotation
public class MyAnn2 {
    let vector: (Float64, Float64)
    public const init(vector: (Float64, Float64)) {
        this.vector = vector
    }
}

@Annotation
public class MyAnn3 {
    let b1: Bool
    let ch1: Rune
    public const init() {
        this.b1 = true
        this.ch1 = 'a'
    }
}

// use annotations
@MyAnn1["Ver1", version: 1]
class C1 {}

@MyAnn1["Pointer", version: 1+1]
@MyAnn2[(1.2, 2.3)]
class C2 {}

@MyAnn1["FullFilledClass", version: 3]
@MyAnn2[(1.2, 2.0/3.0)]
@MyAnn3[]
class C3 {}

const func printMessage(message: String) { }
@aux_01.Aux01[r'a', printMessage]
class C4 {}

main() {
    return 0
}