/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_01_a06_01

  @Level:         1

  @Assertion:    2.1.6.1(6) If non-escaped three double quotations is not matched before the end of
                 current file, a compiler error is reported.

  @Description:  Check that rigth usage of three double quotations (in pair) for multy-line string
                 literals doesn't produce an error.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

public let myPublicTopLetRawMultyLine0: String = """
23t34***
\"""
"""
public var myPublicTopVarRawMultyLine0: String = """
  \"""
  awe4y
  4w5  
  \"""
"""
let myTopLetRawMultyLine0: String = """
  -934;main
  \f
"""
var myTopVarRawMultyLine0: String = """
\"
\\
334++++!>?#
"""

class myClass{
  static let myStaticLetRawMultyLine0: String = """
      ^4-3$$$$$ 34oe
  """
  static var myStaticVarRawMultyLine0: String = """

\r
"""

  public let myPublicLetRawMultyLine0: String = """

\"""

"""
  public var myPublicVarRawMultyLine0: String = """
    0\v
  """

  protected let myProtectedLetRawMultyLine0: String = """
  \"""
  \u{1097}

  """

  protected var myProtectedVarRawMultyLine0: String = """
q3243qg\t\"""
  
  """

  private let myPrivateLetRawMultyLine0: String = """
      \v\034eghdf
"""

  private var myPrivateVarRawMultyLine0: String = """
  """

  let myLetRawMultyLine0: String = """
  w3tyw
  """

  var myVarRawMultyLine0: String = """
  \"""
  """
}

main() {
  let myLocalLetRawMultyLine0: String = """
  \"""
  \r\nNewlin
  \"""

"""

  var myLocalVarRawMultyLine0: String = """
  """
}