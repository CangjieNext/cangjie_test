/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan lex_expected_identifier

class Foo {
    private var a = 0
    public mut prop `1`: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}

main(){
    var res = Foo().`1`
    if (res!=0){
        return 1
    }
    return 0
}