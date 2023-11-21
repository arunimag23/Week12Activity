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
predicate calls(Function caller, string calleeName) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = caller and
    call.getCallee().getName() = calleeName
  )
}

/**
 * Find functions transitively called by tests.
 */
from Function test, string calleeName
where isTest(test) and
      calls*(test, calleeName) and
      calleeName = "pressActionKey"
select test, calleeName, "is transitively called by a test"

