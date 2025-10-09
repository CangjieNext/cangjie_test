// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
// ASSERT: scan error: declaration 'common' extend 'Foo' has a conflicting private property 'f'
package cmp

class Foo {}

common extend Foo {
    common private prop f: String { 
        get() {
            return "common::extend::Foo::prop::f"
        }
    }
}

common extend Foo {
    common private prop f: String {
        get() {
            return "common::extend::Foo::prop::f"
        }
    }
}
