// LEVEL: 0
// EXEC-PIPE-0: %compiler %f -o %output 2>&1 | compare %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
// ASSERT: scan-not might have circular dependency

class b {
    static var x = "str1"
}

class a<T> {
    static mut prop v : String {
        get() { b.x }
        set(_) {  }
    } 
    static let c : String = "str2"
    static init () {
        b.x = v
    }
}

main() {
    a<Int64>()
    0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
