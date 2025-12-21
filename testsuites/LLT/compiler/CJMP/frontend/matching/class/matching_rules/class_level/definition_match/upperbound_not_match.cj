// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
interface interfaceA {}
interface interfaceB {}
public common open class A <: interfaceA { init() {}
}

public common open class B <: interfaceA { init() {}
}

public common class C <: interfaceA & interfaceB { init() {}
}

public common class D <: interfaceA & interfaceB { init() {}
}

public common class E <: A { init() {}
}
// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
// ASSERT: scan-4 sema_platform_has_different_super_type
package cmp

public platform open class A <: interfaceB {
}

public platform open class B <: interfaceA & interfaceB {
}

public platform class C <: interfaceA {
}

public platform class D <: interfaceB & interfaceA {
}

public platform class E <: B {
}

