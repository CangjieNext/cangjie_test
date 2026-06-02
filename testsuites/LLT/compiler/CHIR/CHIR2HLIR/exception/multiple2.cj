// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f

// ASSERT: scan catch all.
// ASSERT: scan finally one.
// ASSERT: scan success.

open class A <: Exception {}

class B <: Exception {}

class C <: A {}

class D <: A {}

class E <: A {}

class F <: Exception {}

main(): Int64 {
    var a = 1
    try {
        throw B();
    } catch (e: C | D | E) {
        e.printStackTrace()
        print("catch C or D or E.\n")
    } catch (_) {
        print("catch all.\n")
    } catch (f: F) {
        print("catch F.\n")
    } finally {
        print("finally one.\n")
    }
    print("success.\n")
    return a - 1
}
