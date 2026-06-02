// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f

// NOTE: usage of deprecated declaration not reported
// if it is inside @Deprecated declaration defined in same package 
// ASSERT: scan function 'reported1' is deprecated.
// ASSERT: scan function 'reported2' is deprecated.

@Deprecated
func not1() {}

@Deprecated
func out1() {
    // Not reported
    not1()
}

@Deprecated
func not2() {}

@Deprecated[strict: true]
func out2() {
    // Not reported
    not2()
}

@Deprecated[strict: true]
func not3() {}

@Deprecated[strict: true]
class Class3 {
    func out3() {
        // Not reported
        not3()
    }
}

@Deprecated
func not4() {}

@Deprecated
class Class4 {
    @Deprecated
    func out4() {
        // Not reported
        not4()
    }
}

@Deprecated[strict: true]
func reported1() {}

@Deprecated
class Class5 {
    @Deprecated
    func out5() {
        // Reported, because `reported1` strictness higher
        reported1()
    }
}

@Deprecated
func reported2() {}

class Class6 {
    @Deprecated
    func boo() {}

    func out6() {
        // Reported, because not inside @Deprecated declaration
        reported2()
    }
}

main() {}

