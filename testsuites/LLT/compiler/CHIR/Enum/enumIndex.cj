// (DEBUG_OPTION) EXEC: %compiler %dumpCHIRDebug %f -o %output
// (CJNATIVE and not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chirtxt | compare %f
// (DEBUG_OPTION) ASSERT: regex TypeCast\(%[0-9]+\) //.* EnumCaseIndex: 0

func foo(a: Array<Option<Int64>>) {
    for (i in a) {
        match (i) {
            case Some(v) => println(123)
            case None => println(456)
        }
    }
}

main() {
    var x:Array<Option<Int64>> = [1, 2, 3]
    foo(x)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
