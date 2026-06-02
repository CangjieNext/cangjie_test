// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

public struct POINT {
    public var x: Int32 = 0
    public var y: Int32 = 0
}

main() {
    let ptPos: Box<POINT> = Box(POINT());
    ptPos.value.x = 2
    ptPos.value.y = 3
    return ptPos.value.x + ptPos.value.y - 5
}
