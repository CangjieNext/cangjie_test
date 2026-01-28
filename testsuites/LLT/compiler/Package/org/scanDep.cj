// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0
// EXEC: %compiler -p . --scan-dependency | compare %f


package a::c

import a::b.*
import a::b.c.*
import d::{
    e,
    f.*
}
import h::ii
import h::k.l as m 
import n::o.p

// (Linux) ASSERT: regex-auto {"package":"a::c","isMacro":false,"accessLevel":"public","dependencies":[{"package":"a::b","isStd":false,"imports":[{"file":"./scanDep.cj","begin":{"line":12,"column":1},"end":{"line":12,"column":14}}]},{"package":"a::b.c","isStd":false,"imports":[{"file":"./scanDep.cj","begin":{"line":13,"column":1},"end":{"line":13,"column":16}}]},{"package":"d::e","isStd":false,"imports":[{"file":"./scanDep.cj","begin":{"line":15,"column":5},"end":{"line":15,"column":6}}]},{"package":"d::f","isStd":false,"imports":[{"file":"./scanDep.cj","begin":{"line":16,"column":5},"end":{"line":16,"column":8}}]},{"package":"h::ii","isStd":false,"imports":[{"file":"./scanDep.cj","begin":{"line":18,"column":1},"end":{"line":18,"column":13}}]},{"package":"h::k","orPackage":"h::k.l","isStd":false,"imports":[{"file":"./scanDep.cj","begin":{"line":19,"column":1},"end":{"line":19,"column":19}}]},{"package":"n::o","orPackage":"n::o.p","isStd":false,"imports":[{"file":"./scanDep.cj","begin":{"line":20,"column":1},"end":{"line":20,"column":14}}]}],"features":[],"product":true}
// (Windows) ASSERT: regex-auto {"package":"a::c","isMacro":false,"accessLevel":"public","dependencies":[{"package":"a::b","isStd":false,"imports":[{"file":".\\scanDep.cj","begin":{"line":12,"column":1},"end":{"line":12,"column":14}}]},{"package":"a::b.c","isStd":false,"imports":[{"file":".\\scanDep.cj","begin":{"line":13,"column":1},"end":{"line":13,"column":16}}]},{"package":"d::e","isStd":false,"imports":[{"file":".\\scanDep.cj","begin":{"line":15,"column":5},"end":{"line":15,"column":6}}]},{"package":"d::f","isStd":false,"imports":[{"file":".\\scanDep.cj","begin":{"line":16,"column":5},"end":{"line":16,"column":8}}]},{"package":"h::ii","isStd":false,"imports":[{"file":".\\scanDep.cj","begin":{"line":18,"column":1},"end":{"line":18,"column":13}}]},{"package":"h::k","orPackage":"h::k.l","isStd":false,"imports":[{"file":".\\scanDep.cj","begin":{"line":19,"column":1},"end":{"line":19,"column":19}}]},{"package":"n::o","orPackage":"n::o.p","isStd":false,"imports":[{"file":".\\scanDep.cj","begin":{"line":20,"column":1},"end":{"line":20,"column":14}}]}],"features":[],"product":true}