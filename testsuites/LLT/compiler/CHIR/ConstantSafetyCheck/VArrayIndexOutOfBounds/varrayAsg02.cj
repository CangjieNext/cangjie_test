// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression test for the ICE "begin of range is zero" (error code 12): the
// VARRAY_GET intrinsic that Translator::TranslateVArrayAssign builds for the
// left-hand side of a compound assignment carried no source location, so the
// out-of-bounds report aborted on the zero DebugLocation instead of naming the
// access. varrayAsg01.cj in this directory covers the read and the plain
// assignment and missed exactly this case.
// One diagnostic per assignment: the VARRAY_GET and the VARRAY_SET now share
// the same loc, so their two identical reports are deduplicated into one.
// All three branches of TranslateVArrayAssign are covered -- `|=` and `+=`
// take the plain compound-assign branch, `&&=` takes AND_ASSIGN and `||=`
// takes OR_ASSIGN -- and the reported range spans the whole assignment.

// LEVEL: 0
// EXEC-PIPE-1: %compiler -Woff all %cmp_opt %f -o %output 2>&1 | compare %f

func bitOrAssign() {
    var b = 4
    var test: VArray<Int64, $3> = [1, 2, 3]
    test[b] |= 1
}

func addAssign() {
    var b = 4
    var test: VArray<Int64, $3> = [1, 2, 3]
    test[b] += 1
}

func andAndAssign() {
    var b = 4
    var test: VArray<Bool, $3> = [true, true, true]
    test[b] &&= false
}

func orOrAssign() {
    var b = 4
    var test: VArray<Bool, $3> = [true, true, true]
    test[b] ||= true
}

main() {

}

/* SCAN
error: array index is out of bounds
  ==> varrayAsg02.cj:25:5:
   | 
25 |     test[b] |= 1
   |     ^^^^^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
   | 

error: array index is out of bounds
  ==> varrayAsg02.cj:31:5:
   | 
31 |     test[b] += 1
   |     ^^^^^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
   | 

error: array index is out of bounds
  ==> varrayAsg02.cj:37:5:
   | 
37 |     test[b] &&= false
   |     ^^^^^^^^^^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
   | 

error: array index is out of bounds
  ==> varrayAsg02.cj:43:5:
   | 
43 |     test[b] ||= true
   |     ^^^^^^^^^^^^^^^^ array index 4 is past the end of array (which contains 3 elements)
   | 

4 errors generated, 4 errors printed.
*/
