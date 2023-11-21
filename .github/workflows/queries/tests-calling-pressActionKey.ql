/**
 * @description Find all tests calling the function "pressActionKey"
 * @kind problem
 * @id javascript/find-tests-calling-pressActionKey
 * @problem.severity recommendation
 */

import javascript

/**
 * Predicate to identify test functions.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
 * Predicate to identify calls to a specific function from another function.
 */
predicate calls(Function caller, Function callee) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = caller and
    call.getACallee() = callee
  )
}

/**
 * Find functions transitively called by tests.
 */
from Function test, Function callee
where isTest(test) and
      calls*(test, callee) and
      callee.getName() = "pressActionKey"
select test, callee, "is transitively called by a test"


