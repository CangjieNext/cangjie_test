/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
public open class public {
    var open: Int64
    var private: Int64
    public public() {
        open = 1
        private = 1
    }

    public open func override() {
        return 2
    }
}

public class override <: public {
    public override func override() {
        return 1
    }
}

main() {
    var a: public = override()
    return a.override() - 1
}
