const madLib = (verb, adjective, noun) => {
    console.log(`We shall ${verb} the ${adjective} ${noun}.`);
};

const isSubstring = (searchString, subString) => {
    let split = searchString.split(" ");
    return split.includes(subString);
};

isSubstring("time to program", "time");
//true

isSubstring("Jump for joy", "joys");
//false