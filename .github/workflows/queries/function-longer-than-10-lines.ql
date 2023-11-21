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
  predicate hasLengthOver(int threshold) {
    getNumLines() > threshold
  }
}

from MyFunction f, int threshold
where f.hasLengthOver(threshold)
  and threshold = 10
select f, f.getNumLines(), "Function longer than 10 lines"

