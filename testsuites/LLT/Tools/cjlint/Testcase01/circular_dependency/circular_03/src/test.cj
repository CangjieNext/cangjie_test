// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface I0 {
}
interface I1 <: I0 {
}
interface I2 <: I5 & I0 {
}
interface I3 <: I2 & I1 & I0 {
}
interface I4 <: I3 & I2 & I1 & I0 {
}
interface I5 <: I4 & I3 & I2 & I1 & I0 {
}