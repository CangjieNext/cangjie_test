// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common struct A {
    let p:Int32
    common A(p:Int32)
    {
        this.p=1
    }
}
// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib  --output-dir ./p  2>&1 | compare %f
// ASSERT: scan sema_platform_init_common_primary_constructor
package cmp
public platform struct A{
    platform init(p:Int32){
        this.p=p
    }
}
