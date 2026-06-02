// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableFuncInlining %f -o %n.%suffix
// (DEBUG_OPTION)EXEC-1: %run %run_opt %n.%suffix

class AAA<XXX, YYY> {
    public let val: Int64 = 1
}

func foo1<TTT>(x: TTT) {
    var y = AAA<TTT, TTT>()
    var lambda = {=> y}()
    lambda
}

main() {
    foo1<Int64>(1).val
}

// ASSERT: scan The mut var in the line:9 and the column:5 was boxed
// ASSERT: scan The nested func in the line:10 and the column:18 was closure converted
// ASSERT: scan The Apply node in the line:10 and the column:18, was optimized by functionInlineForLambda
