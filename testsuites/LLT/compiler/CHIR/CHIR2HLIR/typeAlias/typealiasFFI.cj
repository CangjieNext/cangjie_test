// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-0: %compiler %compile_lib_opt %f
type IM_LIB_EX_T = UInt8

type IM_OBJECT_HANDLE = UInt8

foreign func IM_Agent_ObjCreate(imType: Int32, infoId: UInt32, objHandle: CPointer<CPointer<IM_LIB_EX_T>>,
    handle: CPointer<IM_OBJECT_HANDLE>): UInt32
