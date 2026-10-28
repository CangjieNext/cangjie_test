/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import std.deriving.*

@Derive[ToString]
@DeriveOrder[]
struct WithFields {
    var x = 1
    var y = 2
}

@Derive[ToString]
@DeriveOrder[]
class WithClassFields {
    var z = 3
}

@Derive[ToString]
@DeriveOrder[]
enum WithIncludedProp {
    A

    @DeriveInclude
    prop p: Int64 { get() { 1 } }
}

// an empty payload can also be spelled with only a comment or whitespace

@Derive[ToString]
@DeriveOrder[ /* only a comment */ ]
struct CommentOnlyWithFields {
    var x = 1
}

@Derive[ToString]
@DeriveOrder[
]
struct NewlineOnlyWithFields {
    var y = 1
}

// An empty @DeriveOrder is valid when the type has nothing to order

@Derive[ToString]
@DeriveOrder[]
struct NoMembers {}

@Derive[ToString]
@DeriveOrder[]
struct AllExcluded {
    @DeriveExclude
    var e = 1
}

@Derive[ToString]
@DeriveOrder[]
struct OnlyPlainProps {
    prop q: Int64 { get() { 2 } }
}

@Derive[ToString]
@DeriveOrder[]
enum NoIncludedProps {
    B

    prop r: Int64 { get() { 3 } }
}

main() {
    // reference the plain properties so that their accessors are not reported as unused
    println(OnlyPlainProps().q)
    println(NoIncludedProps.B.r)
}

/* SCAN-IN
error: Not all attributes included: [x, y]
  ==> diagnostics-order-empty.cj:14:1:
   | 
14 | struct WithFields {
   | ^^^^^^ 
   | 

error: Not all attributes included: [z]
  ==> diagnostics-order-empty.cj:21:1:
   | 
21 | class WithClassFields {
   | ^^^^^ 
   | 

error: Not all attributes included: [p]
  ==> diagnostics-order-empty.cj:27:1:
   | 
27 | enum WithIncludedProp {
   | ^^^^ 
   | 

error: Not all attributes included: [x]
  ==> diagnostics-order-empty.cj:38:1:
   | 
38 | struct CommentOnlyWithFields {
   | ^^^^^^ 
   | 

error: Not all attributes included: [y]
  ==> diagnostics-order-empty.cj:45:1:
   | 
45 | struct NewlineOnlyWithFields {
   | ^^^^^^ 
   | 

5 errors generated, 5 errors printed.
*/
