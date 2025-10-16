// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

class Foo {}

common extend Foo {
    common prop f: String { 
        get() {
            return "common::extend::Foo::prop::f"
        }
    }
}

public func readF() {
    var foo = Foo()
    println(foo.f)
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
// ASSERT: scan error: 'platform' property modifier is not match 'common' modifier
package cmp

platform extend Foo{
    platform private prop f: String { 
        get() {
            return "platform::extend::Foo::prop::f"
        }
    }
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

