/**
 * @description Find functions longer than ten lines
 * @kind problem
 * @id javascript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */
import javascript

// Find functions longer than 10 lines

from Function func
where
  func.getNumLines() > 10
select func, "Function longer than 10 lines"
