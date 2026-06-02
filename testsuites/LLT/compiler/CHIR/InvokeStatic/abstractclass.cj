// EXEC: %compiler %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

public abstract class Event {
  public static func getKey(): String { "Event" }
}

public open class SubEvent <: Event {
  public static func getKey(): String { "SubEvent" }
}

public class SSubEvent <: SubEvent {
  public static func getKey(): String { "SSubEvent" }
}

public func getKey<T>(event: T): String where T <: Event { T.getKey() }

main() {
    println(getKey(SSubEvent()))
}

// ASSERT: scan SSubEvent


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
