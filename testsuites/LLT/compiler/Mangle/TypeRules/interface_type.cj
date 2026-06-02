// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused -Woff parser --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define void @_CN7default6TestI1HCNY_2I1E
// (CJNATIVE) ASSERT: scan define void @_CN7default6TestI2HCNY_2I2E
// (CJNATIVE) ASSERT: scan define void @_CN7default6TestI3HCNY_2I3E

public interface I1 {}

sealed interface I2 {}

open interface I3 {}

func TestI1(i1: I1) {}

func TestI2(i2: I2) {}

func TestI3(i3: I3) {}
