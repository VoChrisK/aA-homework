const printCallback = (names) => {
    names.forEach(name => console.log(name));
};

const titleize = (names, callback) => {
    let titleizeNames = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    callback(titleizeNames);
};

// titleize(["Mary", "Brian", "Leo"], printCallback);

function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes phrRRRRRRRRRRRRRRRRRRRRRRRRR!!!!`);
};

Elephant.prototype.grow = function() {
    this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
}

Elephant.prototype.play = function() {
    let randomIndex = Math.floor(Math.random() * this.tricks.length);
    console.log(`${this.name} is ${this.tricks[randomIndex]}`);
}

// let stephano = new Elephant("stephano", 120, ["painting a picture"]);
// stephano.trumpet();
// stephano.grow();
// console.log(stephano.height);
// stephano.addTrick("Jumping through fire");
// stephano.play();

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elephant) {
    console.log(`${elephant.name} is trotting by!`);
};

Elephant.parade = function(herd) {
    herd.forEach(elephant => this.paradeHelper(elephant));
};

// Elephant.parade(herd);


function dinerBreakfast(order) {
    let totalOrder = "I'd like cheesy scrambled eggs";

    return function(order) {
        totalOrder += ` and ${order}`; 
        return totalOrder + " please.";
    };
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");