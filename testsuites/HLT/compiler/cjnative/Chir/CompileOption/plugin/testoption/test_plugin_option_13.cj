/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (!(host_win | target_ohos)) DEPENDENCE: CMakeLists.txt, ./src, const.cj
// (!(host_win | target_ohos)) EXEC: %export plugin_lsp_suffix=%plugin_lsp_suffix && %mkdir build && cd build && cmake .. && make clean && make && make install
// (!(host_win | target_ohos)) EXEC: %compiler %cmp_opt %f --fchir-devirtualization --plugin=./output/libmyplugin1.%host_dylib_suffix -o %output

public interface I1<T> {
    func foo<T>(a: T): T
}

class C1<T> <: I1<T> {
    public func foo<T>(a: T): T {
        return a
    }
}

main() {
    return C1<Int64>().foo(0)
}
