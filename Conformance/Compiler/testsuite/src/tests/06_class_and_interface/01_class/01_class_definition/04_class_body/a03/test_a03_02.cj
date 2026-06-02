/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a03_02

  @Level:         1

  @Assertion: 6.1.1.4(3)
              The syntax of a class body is as the following:
              classBody
                : r'{'
                  classMemberDeclaration*
                  classPrimaryInit?
                  classMemberDeclaration*
                  '}'
                ;
              classMemberDeclaration
                : classInit
                | staticInit
                | variableDeclaration
                | functionDefinition
                | operatorFunctionDefinition
                | macroExpression
                | propertyDefinition
                ;

  @Description: Check that every element except primary constructor can appear several times in the class body

  @Mode: compileonly

  @Negative: no

  @Structure: complex-main

  @Dependencies: macro_defs.cj

  @Issue: 0006124, 0006151
*/

import a03.*

class ManyInits {
  init() {}
  init(fafa: Int64) {}
  init(Pfahk: Float64) {}
  init(vafr: Bool, bajq: Bool) {}
  init(fqan: String) {}
  init(eqpeqn: Rune) {}
}

class ManyVariables {
  static var fqwr = 1
  static let fnjkeq = 2
  public var fnbq = 3
  private let Bdqh = 4
}

abstract class ManyFunctions {
  func fqhkrq<Fo>() {}
  public func Hdgqur(x: Int64): Int64
  static func Bdqbi() {}
  func Baetqp(x: Bool, y: Rune) {
    return 1
  }
}

class ManyOperators {
  public operator func()(x: Int64) {}
  operator func !() {
    return false
  }
  operator func-() {
    return this
  }
  operator func-(rhs: ManyOperators) {}
  operator func&(rhs: ManyOperators) {
    return 1
  }
}

class ManyMacros {
  @macro_f[JFlq](1)
  @macro_f[Eqh](0)
  @macro_v[NJFqmq]("")
  @macro_l[NCqi](false)
}

class ManyPropterties {
  static prop Hdal: Int64 {
    get() {
      1
    }
  }
  static mut prop Ndbkq: Bool {
    get() {
      true
    }
    set(v) {}
  }

  prop fkaq: String {
    get() {
      ""
    }
  }
  private mut prop Nfqak: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}

main() {
}
