// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %disableCodegen %enableChir2RGetOrThrowE -Woff all %f -o %n.%suffix 2>&1 | compare %f

func goo(cond: Bool) {
    var a = Some(100)

    let b1 = a.getOrThrow()
    let b2 = a.getOrThrow()
    var b3 = a.getOrThrow()
    var b4 = a.getOrThrow()

    a = Some(200)

    let b5 = a.getOrThrow()
    var b6 = a.getOrThrow()
}

main() {
    goo(true);
    0
}

// ASSERT: scan [RGetOtThrowE] The usages of the result of getOrThrow at [13,14] have been replaced by the value at [12,14]
// ASSERT: scan [RGetOtThrowE] The usages of the result of getOrThrow at [14,14] have been replaced by the value at [12,14]
// ASSERT: scan [RGetOtThrowE] The usages of the result of getOrThrow at [15,14] have been replaced by the value at [12,14]
// ASSERT: scan [RGetOtThrowE] The usages of the result of getOrThrow at [20,14] have been replaced by the value at [19,14]
