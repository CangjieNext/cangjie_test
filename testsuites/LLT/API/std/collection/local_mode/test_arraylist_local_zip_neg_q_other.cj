/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// DEPENDENCE: ./local_mode_utils.cj
// ERRCHECK: %compiler %local %cmp_opt ./local_mode_utils.cj %f -o %output
// T332: zip requires `other: ArrayList<R> @local!`. The 2026-09-18 correction to the
// closure document records that a @local? operand cannot build the `(T, R) @local!`
// tuple, so the argument must be @local! and a @local? argument is rejected at
// compile time. The @local!/@local! form is covered by test_arraylist_local_zip.cj.
import std.collection.*
import std.core.*

func rejectHalfReferenceOperand(): Int64 {
    let leftSource: Array<Int64> @local! = [1]
    let rightSource: Array<String> @local! = ["a"]
    let left: ArrayList<Int64> @local! = ArrayList<Int64>(leftSource) @local!
    let rightBang: ArrayList<String> @local! = ArrayList<String>(rightSource) @local!
    let rightQ: ArrayList<String> @local? = rightBang
    let invalid: ArrayList<(Int64, String)> @local! = left.zip(rightQ)
    invalid.size
}

main(): Int64 {
    0
}

/* SCAN-IN
error: unable to infer generic argument of this function
  ==> test_arraylist_local_zip_neg_q_other.cj:24:55:
   | 
24 |     let invalid: ArrayList<(Int64, String)> @local! = left.zip(rightQ)
   |                                                       ^^^^^^^^ 
   | 
note: for function type '(Class-ArrayList<Generics-R> @local!) -> Class-ArrayList<Tuple<Generics-T, Generics-R>> @local!' in context type 'Class-ArrayList<Int64> @local!'
    ==> (package std.collection)array_list.cj:1929:25:
note: mismatched types
  ==> test_arraylist_local_zip_neg_q_other.cj:24:64:
   | 
24 |     let invalid: ArrayList<(Int64, String)> @local! = left.zip(rightQ)
   |                                                                ^^^^^^ of type 'Class-ArrayList<Struct-String>', impossible to match parameter type 'Class-ArrayList<Generics-R>'
   | 
*/
