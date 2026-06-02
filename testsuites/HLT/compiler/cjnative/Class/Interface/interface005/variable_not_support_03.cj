/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output



class A{}
interfaca II{}

interface I<T> <: II{
  static var a1: Int32 = 0 
  var a2 = 0 
  var a3: Bool 
  var a4: Array<Rune> 
  var a5: T 

  static let a6: Int32 = 0 
  let a7 = 0 
  let a8: Bool 
  let a9: Array<Rune> 
  let a10: T 

  let a11: A 
  let a12: ()->Unit 
  let a13: List<Bool> 
}

main(): Int64{
	return 0
}
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_unexpected_declaration_in_scope
