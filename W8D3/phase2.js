const fizzBuzz = (array) => {
    let newArr = [];
    for(let i = 0; i < array.length; i++) {
        if(array[i] % 3 == 0 && array[i] % 5 == 0) {
            continue;
        }
        else if(array[i] % 3 == 0 || array[i] % 5 == 0) {
            newArr.push(array[i]);
        }
    }

    return newArr;
};

fizzBuzz([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]);

const isPrime = (number) => {
    if(number < 2) return false;

    for(let i = 2; i < number; i++) {
        if(number % i == 0) return false;
    }

    return true;
};

isPrime(2)
//true

isPrime(10)
//false

isPrime(15485863)
//true

isPrime(3548563)
//false

const sumOfNPrimes = (n) => {
    let sum = 0;
    let i = 0;
    let count = 2;

    while(i < n) {
        if(isPrime(count)) {
            sum += count;
            i++;
        }
        count++;
    }

    return sum;
}

sumOfNPrimes(0)
// 0

sumOfNPrimes(1)
// 2

sumOfNPrimes(4)
// 17