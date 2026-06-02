/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output --error-count-limit=100 2>&1 | compare %f

import std.deriving.*

@Derive[ToString]
@DeriveOrder[c, b, a]
struct AllOk {
    var a = 1

    AllOk(
        var b: Int
    ) {}

    @DeriveInclude
    prop c: Int64 { get() { 3 } }
}

@Derive[ToString]
@DeriveOrder[d, f, e]
struct NonIncludedProperty {
    var d = 4
    var e = 5

    prop f: Int64 { get() { 6 } }
}

@Derive[ToString]
@DeriveOrder[u]
struct StaticProperty {
    static prop u: Int64 { get() { 61 } }
}

@Derive[ToString]
@DeriveOrder[uu]
struct StaticField {
    static var uu = 1
}

@Derive[ToString]
@DeriveOrder[x, y]
struct ExcludedField {
    var x = 4

    @DeriveExclude
    var y = 5
}

@Derive[ToString]
@DeriveOrder[i, k]
struct MissingField {
    var i = 10
    var j = 11
    var k = 12
}

@Derive[ToString]
@DeriveOrder[aa, bb, aa]
struct Duplicated {
    let aa = 1
    let bb = 2
}

@Derive[ToString]
@DeriveOrder[compute]
struct NonField {
    static func compute(): String {
        "aaa"
    }
}

@Derive[ToString]
@DeriveOrder[init, func]
struct Keywords {}

@Derive[ToString]
@DeriveOrder[c, 
    a + b,, /*aaa */]
class Commas {
    let a = 100
    let b = 2
    let c = 3
}

main() {}

/* SCAN-IN
error: Property f is not included, apply @DeriveInclude on it
  ==> diagnostics-order.cj:26:17:
   | 
26 | @DeriveOrder[d, f, e]
   |                 ^ 
   | 

error: Property u is static, can't include it
  ==> diagnostics-order.cj:35:14:
   | 
35 | @DeriveOrder[u]
   |              ^ 
   | 

error: Field uu is static, can't include it
  ==> diagnostics-order.cj:41:14:
   | 
41 | @DeriveOrder[uu]
   |              ^^ 
   | 

error: Field y is excluded via @DeriveExclude
  ==> diagnostics-order.cj:47:17:
   | 
47 | @DeriveOrder[x, y]
   |                 ^ 
   | 

error: Not all attributes included: [j]
  ==> diagnostics-order.cj:56:14:
   | 
56 | @DeriveOrder[i, k]
   |              ^ 
   | 

error: 'aa' is duplicated in @DeriveOrder
  ==> diagnostics-order.cj:64:22:
   | 
64 | @DeriveOrder[aa, bb, aa]
   |                      ^^ 
   | 

error: 'compute' should be a field or property, got func
  ==> diagnostics-order.cj:71:14:
   | 
71 | @DeriveOrder[compute]
   |              ^^^^^^^ 
   | 

error: Expected field or property name, got INIT
  ==> diagnostics-order.cj:79:14:
   | 
79 | @DeriveOrder[init, func]
   |              ^^^^ 
   | 

error: Expected field or property name, got COMMA
  ==> diagnostics-order.cj:79:18:
   | 
79 | @DeriveOrder[init, func]
   |                  ^ 
   | 

error: Expected field or property name, got FUNC
  ==> diagnostics-order.cj:79:20:
   | 
79 | @DeriveOrder[init, func]
   |                    ^^^^ 
   | 

error: Expected comma or nothing, got ADD
  ==> diagnostics-order.cj:84:7:
   | 
84 |     a + b,, /*aaa */]
   |       ^ 
   | 

error: Expected field or property name, got COMMA
  ==> diagnostics-order.cj:84:11:
   | 
84 |     a + b,, /*aaa */]
   |           ^ 
   | 
*/

