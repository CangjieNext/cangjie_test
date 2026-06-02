// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan-not An exception has occurred:

class A <: Exception {}

class B <: Exception {}

class C <: Exception {}

func test(a: Int64) {
    match (a) {
        case 1 => throw A()
        case 2 => throw B()
        case 3 => throw C()
        case _ => println("test")
    }
}

main(): Int64 {
    for (i in 1..5) {
        let v = try {
            println("try begin")
            test(i)
            println("try end")
            1
        } catch (_: A) {
            println("catch A")
            2
        } catch (_) {
            println("catch E")
            3
        }
        if (i == 1) {
            if (v != 2) {
                return 1
            }
        } else if (i < 4) {
            if (v != 3) {
                return 2
            }
        } else if (v != 1) {
            return 3
        }
    }
    return 0
}

/* SCAN
try begin
catch A
try begin
catch E
try begin
catch E
try begin
test
try end
*/
