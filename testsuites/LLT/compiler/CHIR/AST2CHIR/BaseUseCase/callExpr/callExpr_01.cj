// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC-0: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

public interface ComponentRender {}

public open class InteractableViewV2 {
    public open func onClick(): This {
        this
    }
}

public open class Button <: InteractableViewV2 & ComponentRender {}

class A {
    func foo(a: ComponentRender) {}
}

main() {
    var a = A()
    a.foo(Button().onClick())
    0
}
