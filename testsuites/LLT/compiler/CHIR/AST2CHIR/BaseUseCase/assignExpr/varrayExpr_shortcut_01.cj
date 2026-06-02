// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f %noStackInfo -o %output
// RUN-EXEC: %run %run_opt %output

var count = 0

func foo(): Bool {
    count += 1
    return false
}

main() {
    var a = VArray<Bool, $1>(repeat: true);
    a[0] ||= foo()

    return count
}
