// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f
import java.lang.*

func f1(input: JArray<Float16>): JArray<Float16> {
    let local: JArray<Float16> = input
    let localNoType = input
    let localConstructed = JArray<Float16>(1)
    return JArray(1)
}

func f2(input: JArray<Unit>): JArray<Unit> {
    let local: JArray<Unit> = input
    let localNoType = input
    let localConstructed = JArray<Unit>(1)
    return JArray(1)
}

func f3(input: JArray<?Int64>): JArray<?Int64> {
    let local: JArray<?Int64> = input
    let localNoType = input
    let localConstructed = JArray<?Int64>(1)
    return JArray(1)
}

func f4(input: JArray<?JArray<UInt64>>): JArray<?JArray<UInt64>> {
    let local: JArray<?JArray<UInt64>> = input
    let localNoType = input
    let localConstructed = JArray<?JArray<UInt64>>(1)
    return JArray(1)
}

type typealias = JArray<?JArray<UInt64>>

func f5(input: JArray<Array<Int64>>): JArray<Array<Int64>> {
    let local: JArray<Array<Int64>> = input
    let localNoType = input
    let localConstructed = JArray<Array<Int64>>(1)
    return JArray(1)
}

/* SCAN-IN
error: JArray can only be used with Java-compatible types
 ==> jarray_illegal_type_arguments.cj:9:23:
  | 
9 | func f1(input: JArray<Float16>): JArray<Float16> {
  |                       ^^^^^^^ 
  | 

error: JArray can only be used with Java-compatible types
 ==> jarray_illegal_type_arguments.cj:9:41:
  | 
9 | func f1(input: JArray<Float16>): JArray<Float16> {
  |                                         ^^^^^^^ 
  | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:10:23:
   | 
10 |     let local: JArray<Float16> = input
   |                       ^^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:12:35:
   | 
12 |     let localConstructed = JArray<Float16>(1)
   |                                   ^^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:13:12:
   | 
13 |     return JArray(1)
   |            ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:16:23:
   | 
16 | func f2(input: JArray<Unit>): JArray<Unit> {
   |                       ^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:16:38:
   | 
16 | func f2(input: JArray<Unit>): JArray<Unit> {
   |                                      ^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:17:23:
   | 
17 |     let local: JArray<Unit> = input
   |                       ^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:19:35:
   | 
19 |     let localConstructed = JArray<Unit>(1)
   |                                   ^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:20:12:
   | 
20 |     return JArray(1)
   |            ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:23:23:
   | 
23 | func f3(input: JArray<?Int64>): JArray<?Int64> {
   |                       ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:23:40:
   | 
23 | func f3(input: JArray<?Int64>): JArray<?Int64> {
   |                                        ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:24:23:
   | 
24 |     let local: JArray<?Int64> = input
   |                       ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:26:35:
   | 
26 |     let localConstructed = JArray<?Int64>(1)
   |                                   ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:27:12:
   | 
27 |     return JArray(1)
   |            ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:30:31:
   | 
30 | func f4(input: JArray<?JArray<UInt64>>): JArray<?JArray<UInt64>> {
   |                               ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:30:57:
   | 
30 | func f4(input: JArray<?JArray<UInt64>>): JArray<?JArray<UInt64>> {
   |                                                         ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:31:31:
   | 
31 |     let local: JArray<?JArray<UInt64>> = input
   |                               ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:33:43:
   | 
33 |     let localConstructed = JArray<?JArray<UInt64>>(1)
   |                                           ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:37:33:
   | 
37 | type typealias = JArray<?JArray<UInt64>>
   |                                 ^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:39:23:
   | 
39 | func f5(input: JArray<Array<Int64>>): JArray<Array<Int64>> {
   |                       ^^^^^^^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:39:46:
   | 
39 | func f5(input: JArray<Array<Int64>>): JArray<Array<Int64>> {
   |                                              ^^^^^^^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:40:23:
   | 
40 |     let local: JArray<Array<Int64>> = input
   |                       ^^^^^^^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:42:35:
   | 
42 |     let localConstructed = JArray<Array<Int64>>(1)
   |                                   ^^^^^^^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> jarray_illegal_type_arguments.cj:43:12:
   | 
43 |     return JArray(1)
   |            ^^^^^^ 
   | 
*/
