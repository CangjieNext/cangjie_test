// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

// EXEC-PIPE: %compiler %cmp_opt %enableO2 -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

func f(x: VArray<VArray<Int64, $115>, $2>) {
    return x[0][0]
}

main() {
    var arr1: VArray<VArray<Int64, $115>, $2> = [VArray<Int64, $115>(repeat: 12), VArray<Int64, $115>({i => i + 1})]
    var res = f(arr1)
    if (res != 12 || arr1[0][4] != 12) {
        return 1
    }

    return 0
}
