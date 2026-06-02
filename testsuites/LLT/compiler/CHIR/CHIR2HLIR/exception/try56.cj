// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix 2>&1 |compare %f
// ASSERT: scan useless exception type
// EXEC: %run %run_opt %n.%suffix
open class A <: Exception {}

class B <: A {}

main() {
    try {
        throw A()
    } catch (_: A) {
        print("success.")
        return 0
    } catch (_: B) {
        return 1
    } finally {
    }
    return 2
}
