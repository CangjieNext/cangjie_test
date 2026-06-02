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
public class public {
    var open = 1
}

class open {
    var private: Array<public>
    open() {
        var abstract = public()
        var public = public()
        private = [public, abstract]
    }
}

main() {
    var protected = open()
    return protected.private[1].open - 1
}
