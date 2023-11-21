/**
 * @description Find functions longer than ten lines
 * @kind problem
 * @id javascript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */
import javascript

// Define a class to represent functions

class MyFunction extends FunctionLike {
  MyFunction() {
    // Define constraints for MyFunction class
    exists(FunctionLike fl |
      fl.getEnclosingFunction() = this
    )
  }

  // Define a predicate to calculate the number of lines in a function
  predicate hasLengthOverTen(Function func) {
    func.getNumLines() > 10
  }
}

from MyFunction f
where hasLengthOverTen(f)
select f, "Function longer than 10 lines"
