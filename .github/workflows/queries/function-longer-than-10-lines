import javascript

// Define a query for finding functions longer than 10 lines

from FunctionLike fl, int length
where
  fl.getNumLines() > 10 and
  length = fl.getNumLines() - 10
select fl, length, "Function longer than 10 lines"
