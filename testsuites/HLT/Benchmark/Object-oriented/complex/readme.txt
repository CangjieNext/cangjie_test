/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


# Overview
Complex test measures ability of optimizing compiler to apply "escape analysis"/"scalar replacement"/"stack allocation" optimizations to program with non-trivial control flow graph.
For the languages that support `struct` types (it may be named records/structs/inline classes in language documentation) benchmark also provides "allocation-free" version that may be considered as a baseline version.

How to run:
```
      program <iterations> <repeats> <mode>
```

`iterations` defines number of loop iterations to be executed, `repeats` allows to run the same benchmark several times and intended to be used as a warm-up.
   1. `mode == 0` uses dynamic objects of a language (ones that are allocated in heap by default and may have an identity).
   2. `mode == 1` uses `struct` types (if language supports such types) which are expected to be passed-by-value here and there. Usually such types provide tradeoff between CPU (by-value copying takes some CPU cycles) and Memory (struct types are rarely allocated in dynamic memory) unless compiler is able to perform return value optimization and copy elision.

# Optimizing compiler point of view

Control flow graph of benchmark loop is quite simple and modern competitive compiler should be able to generate efiicient code for it.

DO NOT MODIFY SOURCE CODE unless you hundred percent sure that your modification is safe.
