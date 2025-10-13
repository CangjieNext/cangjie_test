// (CJNATIVE)EXEC:%compiler %cmp_opt %n.cj 2>&1

class A {
    var a = 1
    init() {
        var b = 1
        match (b) {
            case 2 => println(b)
            case _ => do {
            ();
        } while ((VArray<Bool, $1>({ i => false})[0]) ) 
        }
    }
}

main() {
    0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
