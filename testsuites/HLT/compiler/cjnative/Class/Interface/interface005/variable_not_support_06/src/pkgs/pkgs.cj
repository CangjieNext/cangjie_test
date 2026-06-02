/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgs

interface I<T>{
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
// ASSERT: regex :4:.* variable 'a1' can not be declared in interface

// ASSERT: regex :5:.* variable 'a2' can not be declared in interface

// ASSERT: regex :6:.*  variable 'a3' can not be declared in interface

// ASSERT: regex :7:.*  variable 'a4' can not be declared in interface

// ASSERT: regex :8:.*  variable 'a5' can not be declared in interface

// ASSERT: regex :10:.* variable 'a6' can not be declared in interface

// ASSERT: regex :11:.* variable 'a7' can not be declared in interface

// ASSERT: regex :12:.*  variable 'a8' can not be declared in interface

// ASSERT: regex :13:.*  variable 'a9' can not be declared in interface

// ASSERT: regex :14:.*  variable 'a10' can not be declared in interface

// ASSERT: regex :16:.*  variable 'a11' can not be declared in interface

// ASSERT: regex :17:.*  variable 'a12' can not be declared in

// ASSERT: regex :18:.*  variable 'a13' can not be declared in interface
