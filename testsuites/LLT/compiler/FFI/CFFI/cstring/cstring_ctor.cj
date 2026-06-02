// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output 2>&1 | compare %f

main() {
    // args number
    CString()
    CString(0, 1)
    // args type
    CString(" ")
    CString(CPointer<Int8>())
    // target type
    var a = CString(CPointer<UInt8>())
    var b: String = CString(CPointer<UInt8>())
    0
}

/* SCAN-IN
error: missing argument for parameter list '(CPointer<UInt8>)' in call
 ==> cstring_ctor.cj:5:12:
  | 
5 |     CString()
  |            ^^ expected 1 argument, found 0
  | 

error: extra argument given for parameter list '(CPointer<UInt8>)' in call
 ==> cstring_ctor.cj:6:12:
  | 
6 |     CString(0, 1)
  |            ^^^^^^ expected 1 argument, found 2
  | 

error: mismatched types
 ==> cstring_ctor.cj:8:13:
  | 
8 |     CString(" ")
  |             ^^^ expected 'CPointer<UInt8>', found 'Struct-String'
  | 

error: mismatched types
 ==> cstring_ctor.cj:9:13:
  | 
9 |     CString(CPointer<Int8>())
  |             ^^^^^^^^^^^^^^^^ expected 'CPointer<UInt8>', found 'CPointer<Int8>'
  | 

error: mismatched types
  ==> cstring_ctor.cj:12:21:
   | 
12 |     var b: String = CString(CPointer<UInt8>())
   |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected 'Struct-String', found 'CString'
   | 

5 errors generated, 5 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
