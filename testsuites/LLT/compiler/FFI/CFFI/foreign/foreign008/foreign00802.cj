// EXEC-PIPE-1: %compiler %ulimit-error %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output 2>&1 | compare %f



foreign func printf(fmt: CString, ...): Unit

main() {
    var arr = Array<Int64>(10, repeat: 0)
    unsafe {
        printf(LibC.mallocCString("Hello, %s\n"), "world!")
        printf(LibC.mallocCString("Hello, %s\n"), 1, "!!")
        printf(LibC.mallocCString("Hello, %p\n"), arr)
        printf(LibC.mallocCString("Hello, %p\n"), 2, arr)
        printf(LibC.mallocCString("Hello, %p\n"), ())
        printf(LibC.mallocCString("Hello, %p\n"), 3, ())
    }
    0
}

/* SCAN-IN
error: mismatched types
  ==> foreign00802.cj:10:51:
   | 
10 |         printf(LibC.mallocCString("Hello, %s\n"), "world!")
   |                                                   ^^^^^^^^ expected 'Interface-CType', found 'Struct-String'
   | 

error: mismatched types
  ==> foreign00802.cj:11:54:
   | 
11 |         printf(LibC.mallocCString("Hello, %s\n"), 1, "!!")
   |                                                      ^^^^ expected 'Interface-CType', found 'Struct-String'
   | 

error: mismatched types
  ==> foreign00802.cj:12:51:
   | 
12 |         printf(LibC.mallocCString("Hello, %p\n"), arr)
   |                                                   ^^^ expected 'Interface-CType', found 'Struct-Array<Int64>'
   | 

error: mismatched types
  ==> foreign00802.cj:13:54:
   | 
13 |         printf(LibC.mallocCString("Hello, %p\n"), 2, arr)
   |                                                      ^^^ expected 'Interface-CType', found 'Struct-Array<Int64>'
   | 

error: Unit cannot be used as argument type of CFunc
  ==> foreign00802.cj:14:51:
   | 
14 |         printf(LibC.mallocCString("Hello, %p\n"), ())
   |                                                   ^ 
   | 

error: Unit cannot be used as argument type of CFunc
  ==> foreign00802.cj:15:54:
   | 
15 |         printf(LibC.mallocCString("Hello, %p\n"), 3, ())
   |                                                      ^ 
   | 

6 errors generated, 6 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
