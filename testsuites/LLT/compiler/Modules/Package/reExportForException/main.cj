// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: JavaException CJException UserException
// EXEC: %compiler %compile_lib_opt -p JavaException -o JavaException.%middle
// EXEC: %compiler %compile_lib_opt -p CJException -o CJException.%middle
// EXEC: %compiler %compile_lib_opt -p UserException -o UserException.%middle
// (CJNATIVE) EXEC: %compiler UserException.%middle CJException.%middle JavaException.%middle main.cj -o %output
// (not CJNATIVE) EXEC: %compiler JavaException.%middle CJException.%middle UserException.%middle main.cj -o %output
// EXEC: %run %run_opt %output %run_args

internal import UserException.*

main() {
    print("hello world\n")

    var cj = UserExceptionExceptionImp();
    cj.say();

    return 0
}
