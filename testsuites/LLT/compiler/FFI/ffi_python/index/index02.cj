// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %pyffi-link %f -o %output
// EXEC: export cjProcessorNum=1 && export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not failed
// ASSERT: scan success

internal import ffi_python.*

let builtin_function: Array<String> = [
    "abs",
    "delattr",
    "hash",
    "memoryview",
    "set",
    "all",
    "dict",
    "help",
    "min",
    "setattr",
    "any", 
    "dir", 
    "hex", 
    "next", 
    "slice", 
    "ascii", 
    "divmod", 
    "id", 
    "object", 
    "sorted", 
    "bin", 
    "enumerate", 
    "input", 
    "oct", 
    "staticmethod", 
    "bool", 
    "eval", 
    "int", 
    "open", 
    "str", 
    "breakpoint", 
    "exec", 
    "isinstance", 
    "ord", 
    "sum", 
    "bytearray", 
    "filter", 
    "issubclass", 
    "pow", 
    "super", 
    "bytes", 
    "float", 
    "iter", 
    "print", 
    "tuple", 
    "callable", 
    "format", 
    "len", 
    "property", 
    "type", 
    "chr", 
    "frozenset", 
    "list", 
    "range", 
    "vars", 
    "classmethod", 
    "getattr", 
    "locals", 
    "repr", 
    "zip", 
    "compile", 
    "globals", 
    "map", 
    "reversed", 
    "__import__", 
    "complex", 
    "hasattr", 
    "max", 
    "round"
]

main(): Int64 {
    Python.load()
    for(func_name in builtin_function) {
        if (!Python[func_name].isAvailable()) {
            print("${func_name} failed.\n")
            return 1
        }
    }
    print("success.\n")
    Python.unload()
    return 0
}