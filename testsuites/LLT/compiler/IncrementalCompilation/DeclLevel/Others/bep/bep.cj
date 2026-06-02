// DEPENDENCE: pkg.cj
// EXEC: %mkdir cjos

// EXEC: %compiler %compile_lib_opt pkg.cj
// EXEC: %move inc.cjo cjos/inc1.cjo

// EXEC: %compiler %compile_lib_opt pkg.cj
// EXEC: %move inc.cjo cjos/inc2.cjo

// EXEC: %compiler %compile_lib_opt pkg.cj
// EXEC: %move inc.cjo cjos/inc3.cjo

// EXEC: %diff cjos/inc1.cjo cjos/inc2.cjo
// EXEC: %diff cjos/inc1.cjo cjos/inc3.cjo

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
