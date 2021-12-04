//1.1
// function doubleOddNumbers(numbers) {
//   const newNumbers = [];
//   for (let i = 0; i < numbers.length; i++) {
//     if (numbers[i] % 2 !== 0) {
//       newNumbers.push(numbers[i] * 2);
//     }
//   }
//   return newNumbers;
// }

// const myNumbers = [1, 2, 3, 4];
// console.log(doubleOddNumbers(myNumbers)); // ==> [2, 6]

const myNumbers = [1, 2, 3, 4, 5, 6];
const doubleOddNumbers  = myNumbers.filter(myNumbers => (myNumbers % 2 !== 0)).map(myNumbers => (myNumbers* 2))
console.log(doubleOddNumbers);

// let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

// let evenNumbers = numbers.map(function(item) {
//    return (item % 2 !== 0);
// }).filter(function(item) {
//     return (item* 2);
//  });

// console.log(evenNumbers);

//1.2

const monday = [
    {
      name: 'Write a summary HTML/CSS',
      duration: 180,
    },
    {
      name: 'Some web development',
      duration: 120,
    },
    {
      name: 'Fix homework for class10',
      duration: 20,
    },
    {
      name: 'Talk to a lot of people',
      duration: 200,
    },
  ];
  
  const tuesday = [
    {
      name: 'Keep writing summary',
      duration: 240, },
    {
      name: 'Some more web development',
      duration: 180,
    },
    {
      name: 'Staring out the window',
      duration: 10, },
    {
      name: 'Talk to a lot of people',
      duration: 200, },
    {
      name: 'Look at application assignments new students',
      duration: 40, },
  ];
  
  const maartjesTasks = monday.concat(tuesday);
  const maartjesHourlyRate = 20;

function computeEarnings(tasks, hourlyRate) {
    console.log(tasks, hourlyRate);
 
    var taskDurations = tasks.map(function (task) {
        return task.duration/60;
    });

    console.log(taskDurations);

    var filteredDurations = taskDurations.filter(function (task) {
        return task >= 2;
    });

    console.log(filteredDurations);

    var totalDuration = filteredDurations.reduce(function (sum, task) {
        return sum + task;
    }, 0);

    return totalDuration * hourlyRate;
}

// eslint-disable-next-line no-unused-vars
const earnings = computeEarnings(maartjesTasks, maartjesHourlyRate);

console.log(`Maartje has earned €${earnings}`);

// Do not change or remove anything below this line
module.exports = {
    maartjesTasks,
    maartjesHourlyRate,
    computeEarnings,
  };
