// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class A {
    private var a:Int32=0
    mut common prop b:Int32{
        get(){
            a
        }
        set(value){
            a=value
        }
    }
    A() {}
}
// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib  --output-dir ./p  2>&1 | compare %f
// ASSERT: scan sema_property_have_same_declaration_in_inherit_mut
package cmp
public platform class A{
    private var d:Int32=1
    platform prop b:Int32{
        get(){
            d
        }
    }
}
