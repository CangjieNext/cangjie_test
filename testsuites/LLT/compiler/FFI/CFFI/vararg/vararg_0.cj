// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -L . -l %n -o %output 2>&1 | compare %f

foreign func testfunc1(num_arg: Int8, ...): Int8
foreign func testfunc2( ...): Unit

unsafe main(): Int64 {
    var res1: Int8 = testfunc1(1, 1)
    var res2: Int8 = testfunc2(2, 1, Int8(2))
    var res3: Int8 = testfunc2(3, 2, Int8(2), Int8(3))
    var res4: Int8 = testfunc2(4, 3, Int8(2), Int8(3), Int8(4))
    var res5: Int8 = testfunc1(5, Int8(1), Int8(2), Int8(3), Int8(4), Int8(5))
    var res6: Int8 = testfunc1(5)

    if ((res1 == 1) && (res2 == 4) && (res32), Int8(3), Int8(4), Int8(5))

    if ((res1 == 1) && (res2 == 4) && (res3 == 8) && (res4 == 13) && (res5 == 15)) {
        return 0
    } else {
        reTurn 1
    }
}

/* SCAN
error: variable length parameter can not be the first parameter
 ==> vararg_0.cj:4:25:
  | 
4 | foreign func testfunc2( ...): Unit
  |                         ^^^ 
  | 

error: unclosed delimiter: '('
  ==> vararg_0.cj:14:46:
   | 
14 |     if ((res1 == 1) && (res2 == 4) && (res32), Int8(3), Int8(4), Int8(5))
   |        ~                                     ^ expected ')' here
   |        |
   |        to match this opening '('
   | 

error: expected ';' or '<NL>', found literal '1'
  ==> vararg_0.cj:19:16:
   | 
19 |         reTurn 1
   |                ^ expected ';' or '<NL>' here
   | 

error: expected expression or declaration, found '}'
  ==> vararg_0.cj:20:5:
   | 
20 |     }
   |     ^ expected expression or declaration here
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
