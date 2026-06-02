// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %enableCompileDebug %diag_json %f 2>&1 | compare %f

class A <: Exception {}

class B <: Exception {}

main(): Int64 {
    var a = 1
    try {
        throw A();
    } catch (e: A) {
        print("catch\n")
    } catch (_) {
        e.printStackTrace()
    } finally {
        print("finally\n")
    }
    return a - 1
}
// ASSERT: scan sema_undeclared_identifier
