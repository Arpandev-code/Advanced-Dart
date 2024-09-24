//LINQ -> Language Integrated Query
//Functinal collection

import 'customers.dart';

void main() {
  var number = [5, 2, 8, 3, 9, 1, 6, 4, 7, 10];
  var result = number.where((e) => e > 5);
  // result.forEach((e) => print(e));
  //Restriction Operator
  // customers.forEach((e) => print(e));
//find the customer whose age is greater than 20 or id is less than 5
  var whereResult = customers.where((c) => c.age > 20 || c.id < 5);
  // whereResult.forEach((c) => print(c));
//Projection Operatora(select)
  var projResult = customers
      .where((c) => c.age > 20)
      .map((c) => {"name": c.customerName, "age": c.age});
  // projResult.forEach((c) => print(c));
  // projResult.forEach((c) => print(c));
//Projection Operator(select many -compoud)
//List inside list acesss i.c. if we want to acess Itarable inside a list
  var compoudResult = customers
      .where((e) => e.id > 5)
      .expand((el) => el.Orders)
      .where((o) => o.orderTotal > 100)
      .map((e) => e.orderTotal);
  // compoudResult.forEach((o) => print(o));

  //find the customer whose age is greater than 20 or id is less than 5 and order total is greater than 2000\

  var compoudResult2 = customers
      .expand((c) => c.Orders.where((o) => o.orderTotal > 2000).map((e) =>
          {"id": c.id, "name": "${c.customerName}", "order": e.orderTotal}))
      .take(3); // take first 3 result with take
  var compoudResult3 = customers
      .expand((c) => c.Orders.where((o) => o.orderTotal > 2000).map((e) =>
          {"id": c.id, "name": "${c.customerName}", "order": e.orderTotal}))
      .skip(3); //skip the first 3 result with skip
  //printing skiped result
  // compoudResult3.forEach((c) => print(c));
  //printing first 3 result
  //compoudResult2.forEach((c) => print(c));

  //Partitioning Operator
  var compoudResult4 = customers.expand((c) =>
      c.Orders.where((o) => o.orderTotal > 2000)
          .map((e) => e.orderTotal)
          .takeWhile((e) => e > 4000));
  compoudResult4.forEach((c) => print(c));

  //Set Operator
}
