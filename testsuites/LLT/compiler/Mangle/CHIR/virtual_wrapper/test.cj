// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) LEVEL: 0
// (CJNATIVE and DEBUG_OPTION) EXEC: %frontendCompiler --dump-ir %f 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan-not define void @"_CVN7default1IIG_E4foo1HG_$N7default2CAE$CN7default1IIG_Eb"

interface I<T> {
    func foo1(a: T) {}
}

class CA <: I<Bool> {}

main() {
    CA().foo1(true)
}
