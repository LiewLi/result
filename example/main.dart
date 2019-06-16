import 'package:result/result.dart';

main() {
  var s= Result.success(2);
  print(s.get()); // 2

  var ss = s.map(
    (x) => x + 1
  );
  print(ss.get()); // 3
 
  var f = Result.failure(Exception("exception"));
  print(f);//Result, failure

  var ff = f.map(
    (f) => Exception("another exception")
  );
  print(ff);// Result, failure

  worker() {
    //work staff
    throw Exception("work exception");
  }
  try {
    var r = Result(worker());
    r = r.get();
  } catch (e) {
    print(e); // work exception
  }
}