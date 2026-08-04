/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.regex.*

let lineBreak = Regex("\\r\\n?|\\n|\u{2028}|\u{2029}")

let lineBreakG = lineBreak

// 仓颉暂不支持 Unicode 正则

let nonASCIIwhitespace =["\u{1680}","\u{180e}","\u{2000}","\u{2001}","\u{2002}","\u{2003}","\u{2004}","\u{2005}","\u{2006}","\u{2007}","\u{2008}","\u{2009}","\u{200a}","\u{202f}","\u{205f}","\u{3000}","\u{feff}"]
