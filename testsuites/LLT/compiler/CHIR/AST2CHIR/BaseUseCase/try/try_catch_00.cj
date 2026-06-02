// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-PIPE-1: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan-1 An exception has occurred:

class A <: Exception {}

class B <: Exception {}

class C <: Exception {}

func test(a: Int64) {
    match (a) {
        case 1 => throw A()
        case 2 => throw B()
        case 3 => throw C()
        case _ => throw Exception()
    }
}

main() {
    var i = 1
    while (i <= 4) {
        try {
            println("try begin")
            test(i)
            println("try end")
        } catch (_: A) {
            println("catch A")
        } catch (a: B | C) {
            println("catch B or C")
        }
        i++
    }
}

/* SCAN-IN
try begin
catch A
try begin
catch B or C
try begin
catch B or C
try begin
 */
