package A

public var (a,b) = (1, 1.1)

// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:VarWithPatternDecl in file vwpd_type_changed_Full_2.old.cj in line 3 in column 1
// ASSERT: scan the changed decl after Spreading is:a in file vwpd_type_changed_Full_2.old.cj in line 3 in column 13
// ASSERT: scan the changed decl after Spreading is:b in file vwpd_type_changed_Full_2.old.cj in line 3 in column 15



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
