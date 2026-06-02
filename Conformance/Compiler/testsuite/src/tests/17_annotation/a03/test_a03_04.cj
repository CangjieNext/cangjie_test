/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_a03_04

  @Level:         1

  @Assertion:  17(3) Annotations can be used on different declarations.
                Its syntax specification is defined as:
                annotationList: annotation+;
                annotation
                : '@' (identifier '.')* identifier ('(' annotationArgumentList ')')?
                ;
                annotationArgumentList
                : annotationArgument (',' annotationArgument)* ','?
                ;
                annotationArgument
                : identifier ':' expression
                | expression
                ;

  @Description:  Check that with mistake the annotationArgumentList, the annotation will generate an error
  @Mode:         compileonly
  @Negative:     yes
  @Issue:        0006622
*/

@Annotation
public class TestA0304 {
    public let greeting: String
    public let name: String

    public const init(greeting: String, name: String) {
        this.greeting = greeting
        this.name = name
    }
}

@IHello
class foo {}

main() {}
