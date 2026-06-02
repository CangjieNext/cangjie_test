// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// case: same common in one file
// expect: error info code
// EXEC-PIPE-0: %compiler %noColor --experimental %f --output-type=chir 2>&1 | compare %f

package cmp


common class A {
    common private var name:String
    common init(name:String){
        this.name = name;
    }
    init() {}
}

/* SCAN
*/
