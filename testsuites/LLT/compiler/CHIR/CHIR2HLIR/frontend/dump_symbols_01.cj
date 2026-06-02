// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-1: %frontendCompiler %dump-symbols %f 2>&1 | compare %f
// ASSERT: scan "astKind": "package_spec"
// ASSERT: scan "packageName": "nonsense"
// ASSERT: scan "packagePos":
// ASSERT: scan "packageNamePos":
// ASSERT: scan "astKind": "import_spec"
// ASSERT: scan "fromPos":
// ASSERT: scan "moduleName": "mod1""moduleName": "mod1"
// ASSERT: scan "importPos":
// ASSERT: scan "packageName": "p1"
// ASSERT: scan "packageNamePos":
// ASSERT: scan "importedItemName": "f1"
// ASSERT: scan "importedItemNamePos":
// ASSERT: scan "asPos":
// ASSERT: scan "asIdentifier": "foo"
// ASSERT: scan "asIdentifierPos":

package nonsense

internal import mod1.p1.f1 as foo
