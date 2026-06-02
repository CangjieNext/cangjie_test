/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A <: Exception {
    public func me():Unit {
        print("Hello A!")
    }
}

class B <: Exception {
    public func me():Unit {
        print("Hello B!")
    }
}

class C <: Exception {
    public func me():Unit {
        print("Hello C!")
    }
}

main() {
    try {
        throw B()
    } catch (a: A | B | C) {
        a.me();
        return 0
    } finally {}
    return 1
}
// ASSERT: scan sema_not_member_of
