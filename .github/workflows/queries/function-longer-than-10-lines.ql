import javascript
/**
 * @description Find functions longer than 10 lines 
 * @kind problem
 * @id javascript/function-longer-than-10-lines
 * @problem.severity recommendation
 */

// Select functions longer than 10 lines
class MyFunction extends FunctionLike {
  MyFunction() {
    exists(FunctionDeclaration fd |
      fd = this and
      fd.getNumLines() > 10
    )
  }
}

from MyFunction f
select f, f.getNumLines(), "Function longer than 10 lines"



