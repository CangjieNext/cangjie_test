// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow wrapping %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args

main() {
    var data = Array<Byte>(512, repeat: 2)
    var itemArr = Array<Byte>(512, repeat: 33)
    data.copyTo(itemArr, 0, 0, 512)
    0
}
