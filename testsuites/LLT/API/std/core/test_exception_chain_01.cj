/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args 2>&1 | compare %f
// ASSERT: scan ServerInternalException: Failed to apply configuration
// ASSERT: scan Caused by: InvalidConfigurationException: Configuration file is invalid.
// ASSERT: scan Caused by: FSException: File not found.

/* Output will be like: 
An exception has occurred:
ServerInternalException: Failed to apply configuration.
	 at default::serve()(/home/chaos/gitcode/fork/webserverv3.cj:11)
	 at default::main()(/home/chaos/gitcode/fork/webserverv3.cj:4)
Caused by: InvalidConfigurationException: Configuration file is invalid.
	 at default::config()(/home/chaos/gitcode/fork/webserverv3.cj:21)
	 at default::serve()(/home/chaos/gitcode/fork/webserverv3.cj:9)
	 ... 1 more
Caused by: FSException: File not found.
	 at default::readFile()(/home/chaos/gitcode/fork/webserverv3.cj:30)
	 at default::parseFile()(/home/chaos/gitcode/fork/webserverv3.cj:26)
	 at default::config()(/home/chaos/gitcode/fork/webserverv3.cj:19)
	 ... 2 more
*/

import std.fs.*

main(): Unit {
  serve()
}

func serve() {
  try {
    config()
  } catch(e: Exception) {
    let exception = ServerInternalException("Failed to apply configuration.")
    exception.causedBy = e
    throw exception
  }
}

func config() {
  try {
    parseFile()
  } catch(e: Exception) {
    throw InvalidConfigurationException("Configuration file is invalid.", e)
  }
}

func parseFile() {
  readFile()
}

func readFile() {
  throw FSException("File not found.")
}

class ServerInternalException <: Exception {
  public init() {
    super()
  }
  public init(message: String) {
    super(message)
  }
  protected override func getClassName(): String {
      return "ServerInternalException"
  }
}

class InvalidConfigurationException <: Exception {
  public init() {
    super()
  }
  public init(message: String) {
    super(message)
  }
  public init(message: String, causedBy: Exception) {
    super(message, causedBy)
  }
  protected override func getClassName(): String {
      return "InvalidConfigurationException"
  }
}