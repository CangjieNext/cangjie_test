// LEVEL: 0
// EXEC-PIPE: cjc-frontend %cmp_utest_opt --no-prelude %f 


class Data {
    public var data: Int32 = 1
}

func run(): Int64 {
    var value : Data = Data();
    if (value.data != 1) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
 

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
