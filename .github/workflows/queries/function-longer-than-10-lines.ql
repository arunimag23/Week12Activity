import javascript

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

  predicate hasLengthOverTen() {
    getNumLines() > 10
  }
}

from MyFunction f
where f.hasLengthOverTen()
select f, f.getNumLines(), "Function longer than 10 lines"


