// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output

class NumberValue {}

class NumberArray {
    var _array: Array<Any> = Array<Any>()

    func leftApply(parameters: Array<Float64>): NumberValue {
        var result: Any = _array
        for (i in 0..parameters.size) {
            let index = Int64(parameters[i])
            if (!(index < (result as Array<Any>).getOrThrow().size)) {}
            result = (result as Array<Any>).getOrThrow()[index]
        }
        return (result as NumberValue).getOrThrow()
    }
}

main() {
    0
}
