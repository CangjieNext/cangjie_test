// LEVEL: 0
// EXEC: %compiler --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const func func_1700263933283_172(param_1700263933283_173 : String) : Rune {
    const var_1700263933283_420 : Rune = r'a';
    const func func_1700263933283_185() {

    }
    const func func_1700263933283_178(a:Int64) : Rune {
        func_1700263933283_185();
        var_1700263933283_420
    }
;
    if (false) { func_1700263933283_178(2) } else { r'd' } 
}

main() {
    println(func_1700263933283_172("222"))
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
