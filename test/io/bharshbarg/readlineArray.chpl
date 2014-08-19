config const n = 100;
config const line = 60;
config const debug = false;

var f = openmem();
var r = f.reader();
var w = f.writer();

var numChars = 0;
for i in 1..n {
  for j in 1..line do w.write(j%10);
  w.writeln();
  numChars += line + 1;
}

var data : [1..numChars] uint(8);

var total : int = 0;
for i in 1..n {
  var numRead : int;
  r.readline(data, numRead, total+1);
  total += numRead;
}

var numWrong = 0;
var idx = 1;
for i in 1..n {
  for j in 1..line {
    if data[idx] != ascii((j%10):string) then numWrong += 1;
    idx += 1;
  }
  if data[idx] != 0x0A then numWrong += 1; // newline character
  idx += 1;
}

if numWrong != 0 then writeln(numWrong, " out of ", numChars, " characters were wrong");

if total != numChars then writeln("FAILURE: read ", total, ", but expected ", numChars);
else writeln("SUCCESS");
