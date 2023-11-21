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
 * Predicate to identify calls to the function "pressActionKey".
 */
predicate callsPressActionKey(CallExpr call) {
  call.getCallee().getName() = "pressActionKey"
}

from Function test, CallExpr call
where isTest(test) and
      callsPressActionKey(call) and
      call.getEnclosingFunction() = test
select test, "calls pressActionKey"
