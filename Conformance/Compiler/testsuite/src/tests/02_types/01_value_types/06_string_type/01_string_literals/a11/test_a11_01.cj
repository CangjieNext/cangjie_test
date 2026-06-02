/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_01_a11_01

  @Level:         1

  @Assertion:    2.1.6.1(11) Different from the multi-line string literals, escaping rules do not apply in a multi-line raw string.

  @Description:  Check that usage of alone character \ and non-escape characters """ doesn't produce an error.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

public let myPublicTopLetRawMultyLine0: String = #"
"""
"#
public let myPublicTopLetRawMultyLine1: String = #"

\

"#

public var myPublicTopVarRawMultyLine0: String = #"
  """
  
"#
public var myPublicTopVarRawMultyLine1: String = #"\"#

let myTopLetRawMultyLine0: String = ##"""""##
let myTopLetRawMultyLine1: String = ##"
\"##
var myTopVarRawMultyLine0: String = #"

""""#
var myTopVarRawMultyLine1: String = ####"
      \
"####

class myClass{
  static let myStaticLetRawMultyLine0: String = #""""
  "#
  static let myStaticLetRawMultyLine1: String = #"   \
  "#
  static var myStaticVarRawMultyLine0: String = ###"\
  "###
  static var myStaticVarRawMultyLine1: String = ###"""""###

  public let myPublicLetRawMultyLine0: String = ###"\



  "###
  public let myPublicLetRawMultyLine1: String = ###""""
  


  "###

  public var myPublicVarRawMultyLine0: String = #####""
  """#####
  public var myPublicVarRawMultyLine1: String = #"\"#

  protected let myProtectedLetRawMultyLine0: String = #####"
  """
  "#####
  protected let myProtectedLetRawMultyLine1: String = #####"
                               \
  "#####

  protected var myProtectedVarRawMultyLine0: String = ##"
  
  """
  
  "##
  protected var myProtectedVarRawMultyLine1: String = ############"\"############

  private let myPrivateLetRawMultyLine0: String = ###" """
  "###
  private let myPrivateLetRawMultyLine1: String = #####"\"#####

  private var myPrivateVarRawMultyLine0: String = ###"""""###
  private var myPrivateVarRawMultyLine1: String = ##"\"##

  let myLetRawMultyLine0: String = #"
  """
  "#
  let myLetRawMultyLine1: String = #"
  \
  "#

  var myVarRawMultyLine0: String = ##"
  \"##
  var myVarRawMultyLine1: String = ##"""""##
}

main() {
  let myLocalLetRawMultyLine0: String = ##"

"""

  "##
  let myLocalLetRawMultyLine1: String = ##"

\
  "##
  var myLocalVarRawMultyLine0: String = #" \ "#
  var myLocalVarRawMultyLine1: String = #" 
  """
  
   "#
}