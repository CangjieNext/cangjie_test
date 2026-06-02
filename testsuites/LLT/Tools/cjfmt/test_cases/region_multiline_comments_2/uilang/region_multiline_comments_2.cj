// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// REGION: 1:56


/*
 * Copyright style comment
 */

/*malformed
*Copyright style comment

*statement 
*/


/*short comment
  some comment
*/
class A {}

/*short comment*/

class A {/*
  members commented

  func a() {

  }

  func b() {

  }
*/}

/*

   long comment

 */

class A {
func a() {
  /*let a = 1
  let a = 1
  let a = 1 */
  let a = 1
  /*let a = 1
  let a = 1
  let a = 1
  let a = 1*/
} 
}

/*
eof
comment
*/

/*
and
another
one */
