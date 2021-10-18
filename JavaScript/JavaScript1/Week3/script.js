//1

let myString = ["hello","this","is","a","difficult","to","read","sentence"];
console.log(myString.join(" "));

//2

let favoriteAnimals = ["blowfish", "capricorn", "giraffe"];
favoriteAnimals.push("turtle")
favoriteAnimals[1]="meerkat";
console.log(favoriteAnimals);
console.log("The array has a length of: ",favoriteAnimals.length);
favoriteAnimals.splice(2, 1);
console.log(favoriteAnimals);
console.log("The item you are looking for is at index: ",favoriteAnimals.indexOf('meerkat'));

//More JavaScript
//1
function sumOf(a, b,c) {
    return a + b + c;
  } 
  console.log(sumOf(6,7,8));
  console.log(sumOf(99,88,77));

//2
function colorCar(a){
    if(a='color'){
    return "a red car"
}
}
console.log(colorCar('color'));
//3

//4
function vehicleType(code){
    if(code===1){
    return 'a blue car'
    }
    if(code===2){
    return 'a blue motorbike'
}
}
console.log(vehicleType(2));

//5
if (3 === 3) {
    console.log("yes");
  } else {
    console.log("no");
  }
  console.log(3 === 3);
  console.log(3 === 9);

//6
function vehicleType(code,age){
  return 'blue',code,age
}
console.log(('"blue"'),1,",",5);

//7
let driveVerhicle = ["motorbike", "caravan", "bike"];
//8
console.log(driveVerhicle);

//9
function vehicle(x,y,z){
}

//12
var objectA = {}
var objectB = new Object()
console.log(Object);

//13
var myStudent = {
  name:  'Max',
  age:    45,
  weight:  78,
  height: 179
};
console.log(myStudent);

//15
let x = [1, 2, 3];
let y = [1, 2, 3];
let z = y;
console.log('Is x==y',x==y);
console.log('Is x===y',x===y);
console.log('Is z==y',z == y);
console.log('Is z==x',z == x);

//16
let o1 = { foo: "bar" };
let o2 = { foo: "bar" };
let o3 = o2;
console.log(o3===o2);
console.log(o2===o3);
//17
let bar = 42;
typeof typeof bar;
console.log(bar);
console.log(typeof 'bar');