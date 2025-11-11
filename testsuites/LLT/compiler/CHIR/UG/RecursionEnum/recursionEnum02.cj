// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/[0-9]*\_BoxRecursionEnum.chir | compare %f

enum MyOption<T> {
    Some(T) | None
}

struct SA {
    var data: MyOption<SA> = MyOption<SA>.None
}

main() {}

// ASSERT: regex-begin struct @_CN7default2SAE {.*
// ASSERT: regex-next var data: Box<Enum-_CN7default8MyOptionIG_E<Struct-_CN7default2SAE>>&
