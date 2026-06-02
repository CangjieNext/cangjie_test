// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package registry

internal import std.collection.HashMap
internal import converter.*

public open class BaseRegistry<BaseConverter> {}

public class TypeConverterRegistry <: BaseRegistry<BaseConverter> {}
