/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output
// EXEC:%set_stdx_path %run %run_opt %output %run_args

/*
 * Test description: Processing of escape characters when JsonObject invokes the toString function
 * Test API:
 *      public class JsonObject <: JsonValue
 *          public func toJsonString(depth: Int64, bracketInNewLine!: Bool = false): String
 *          public func toString(): String
 */

import stdx.encoding.json.*

main() {
    var str = ##""\\ / \" \n \b \r \f \t \u0001 \u0002 \u0003 \u0004 \u0005 \u0006 \u0007 \u0008 \u0009 \u000a \u000b \u000c \u000d \u000e \u000f \u0010 \u0011 \u0012 \u0013 \u0014 \u0015 \u0016 \u0017 \u0018 \u0019 \u001a \u001b \u001c \u001d \u001e \u001f \u0020 \u007f""##
    var expect = ##""\\ / \" \n \b \r \f \t \u0001 \u0002 \u0003 \u0004 \u0005 \u0006 \u0007 \b \t \n \u000b \f \r \u000e \u000f \u0010 \u0011 \u0012 \u0013 \u0014 \u0015 \u0016 \u0017 \u0018 \u0019 \u001a \u001b \u001c \u001d \u001e \u001f   \u007f""##
    var jv = JsonValue.fromStr(str)
    var jvToStr = jv.toString()
    if (jvToStr != expect) {
        return 1
    }
    var jvToJsonStr = jv.toJsonString()
    if (jvToJsonStr != expect) {
        return 2
    }
    return 0
}
