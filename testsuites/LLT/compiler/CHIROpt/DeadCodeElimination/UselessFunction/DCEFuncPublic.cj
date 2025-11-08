// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (LLVM and not Windows) EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableO2 --disable-codegen  -Woff all %f -o %n.%suffix 2>&1 | compare %f

public func goo(): Unit {
    print("2")
}

public func foo(): Unit {
    print("1")
}

public open class CA {
    public func foo(): Unit {
        print("a")
    }
}

public class CB {
    public func foo(): Unit {
        print("b")
    }
}

main() {
    goo()
    0
}

// ASSERT: regex \[DCE\] The .*foo.* function of default package at \[14,1\] has been deleted
// ASSERT: regex \[DCE\] The .*CA.*foo.* function of default package at \[19,5\] has been deleted
// ASSERT: regex \[DCE\] The .*CB.*foo.* function of default package at \[25,5\] has been deleted