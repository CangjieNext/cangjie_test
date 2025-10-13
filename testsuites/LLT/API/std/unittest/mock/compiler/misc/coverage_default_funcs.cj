/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -Woff=all --mock=on --coverage %f -o %output 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*
import std.collection.*

public interface ExecutionContext {}
public interface ValidationContext {}
public class JsonNode {}
public class JsonNodePath {}
public class MessageSourceValidationMessageBuilder {}
public class FormatValidator {}

public interface I {
    func matches(executionContext: ExecutionContext, value: ?String): Bool {
        return true
    }
    func matches(executionContext: ExecutionContext, validationContext: ValidationContext, value: ?String): Bool {
        return matches(executionContext, value)
    }
    
    func matches(executionContext: ExecutionContext, validationContext: ValidationContext, value: JsonNode): Bool {
        return matches(executionContext, validationContext, "value.textValue()")
    }
    func matches(
        executionContext: ExecutionContext,
        validationContext: ValidationContext,
        node: JsonNode,
        rootNode: JsonNode,
        instanceLocation: JsonNodePath,
        assertionsEnabled: Bool,
        formatValidator: FormatValidator
    ): Bool {
        return matches(executionContext, validationContext, node)
    }
    
    func validate(
        executionContext: ExecutionContext,
        validationContext: ValidationContext,
        node: JsonNode,
        rootNode: JsonNode,
        instanceLocation: JsonNodePath,
        assertionsEnabled: Bool,
        messageBuilder: () -> MessageSourceValidationMessageBuilder,
        formatValidator: FormatValidator
    ): HashSet<String> {
        if (!matches(
            executionContext,
            validationContext,
            node,
            rootNode,
            instanceLocation,
            assertionsEnabled,
            formatValidator
        )) {
            return HashSet<String>()
        }
        return HashSet<String>()
    }
}

main() {0}