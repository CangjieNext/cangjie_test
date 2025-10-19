// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt --experimental --output-type=chir %f 2>&1 | compare %f
// ASSERT: scan error: declaration 'common' extend 'Foo' has a conflicting private function 'foo'

package example.cmp

class Foo {}

common extend Foo {
    private func foo():Int64 { return 0 }
}

common extend Foo {
    private func foo():Int64 { return 1 }
}