use Time;

proc main {
  const n = 5;

  var a: [1..n] int;
  var B$: [1..n] sync bool;

  for i in 1..n do begin {
    a[i] = foo(i);
    B$[i] = true;
  }

  for i in 1..n {
    B$[i];
    assert(a[i] != 0);

    writeln(a[i]);
  }
}

proc foo(i: int) return i**2;
