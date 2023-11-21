import javascript

class MyFunction extends Declaration {
  MyFunction() {
    exists(FunctionLike fl |
      fl.getAncestorOfType(this) and
      fl.getEnclosingFunction() = this
    )
  }

  predicate hasLengthOverTen() {
    getNumLines() > 10
  }
}

from MyFunction f
where f.hasLengthOverTen()
select f, f.getNumLines(), "Function longer than 10 lines"



