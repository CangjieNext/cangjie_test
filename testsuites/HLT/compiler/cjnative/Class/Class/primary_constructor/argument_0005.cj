/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f

class Data {
    var b: Float32
    Data(private var a: Int32) {
        this.a = a
        b = 2.0
    }
}

func run(): Int64 {
    var value: Data = Data(1);
    if ((value.a == 1) && (value.b == 2.0)) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_invalid_access_control
