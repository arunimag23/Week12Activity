import javascript
/**
 * @description Find functions longer than 10 lines 
 * @kind problem
 * @id javascript/function-longer-than-10-lines
 * @problem.severity recommendation
 */

// Select functions longer than 10 lines

from Function func
where func.getNumLines() > 10 
select func




