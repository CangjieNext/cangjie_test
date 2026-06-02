/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public struct Record15 {
    //var var331 : Int64 = 112;
    public var var300: Unit = ();
    public var var332: Int64 = 112;
    public init(var300!: Unit = (), var332!: Int64 = 112) {
        this.var300 = var300
        this.var332 = var332
    }
}

main(): Int64 {
    let var24: Record15 = Record15();
    if (var24.var332 != 112) {
        return 1
    }
    return 0;
}
