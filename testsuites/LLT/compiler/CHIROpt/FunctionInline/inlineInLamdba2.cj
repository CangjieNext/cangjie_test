// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-0: %compiler %enableO2 --int-overflow=wrapping -g %f -o %output
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_args

func foo() {
    var var_1747940757827_230: (Rune) -> Unit = {lambdaParameter_1747940757827_233: Rune =>};
    func func_1747940757827_264(): Int64 {
        func func_1747940757827_269(): Int64 {
            var_1747940757827_230(r"v")
            0
        }
        func_1747940757827_269()
        0
    }
    func_1747940757827_264()
}

main() {
    foo()
}
