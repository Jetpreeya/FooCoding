//1.1
const bookTitles  = ["Eloquent JavaScript","Heja Mikael","The Dutch House","Normal People","Trick Mirror","The Bright Hour"," The Lord of the rings"," The hobbit","The davinci code","Onehundred years of solitude"]

// console.log(bookTitles);

//1.3
let title = document.createElement('book')
bookTitles.forEach(book => {
    let listItem = document.createElement("li");
    let itemText = document.createTextNode(book);
    listItem.appendChild(itemText);
    title.appendChild(listItem)
})
document.body.appendChild(title)


//1.4

const bookInfo= {
 eloquentJavaScript : {
    title : "Eloquent JavaScript",
    language : "English",
    author : "Marijn Haverbeke",
    
},
hejaMikael : {
    title : "Heja Mikael",
    language : "Swedish",
    author : "Mikael Rosengren",
   
},

theDutchHouse : {
    title : "The Dutch House",
    language : "English",
    author : "Ann Patchett"
},

normalPeople : {
    title : "Normal People",
    language : "English",
    author : "Sally Rooney"
},

trickMirror : {
    title : "Trick Mirror",
    language : "English",
    author : "Jia Tolentino"
},

theBrightHour : {
    title : "The Bright Hour",
    language : "English",
    author : "Nina Riggs"
},

theLordOfTheRings : {
    title : "The Lord Of The Rings",
    language : "English",
    author : "J.R.R. Tolkien and Quirino Principe"
},

theHobbit :{
    title : "The Hobbit",
    language : "English",
    author : "J.R.R. Tolkien and David Wyatt"
},
theDavinciCode:{
    title : "The DaVinci Code",
    language : "English",
    author : "Dan Brown"
},

oneHundredYearsOfSolitude:{
    title: "One Hundred Years Of Solitude",
    language : "English",
    author : "Gabriel García Márquez"
    }
};

1.5
// const article = document.querySelector("article");
// let bookList = document.createElement("infoBookList");
// for (const Object in bookInfo) {
//   let listItem = document.createElement("H3");
//   listItem.innerHTML = `Title: ${bookInfo[Object].title}<br>Language: ${bookInfo[Object].language}<br>Author: ${bookInfo[Object].author}`;
//   bookList.append(listItem);
// }

// article.append(bookList);



1.7
const bookImages = {
    eloquentJavaScript:'imgBook/eloquent_javascript.jpg',
    hejaMikael: 'imgBook/Hej_Mikael.jpg',
    theDutchHouse: 'imgBook/The_Dutch_House.jpg',
    normalPeople: 'imgBook/Normal_People.jpg',
    trickMirror: 'imgBook/Trick_Mirror.jpg',
    theBrightHour: 'imgBook/The_Bright_Hour.jpg',
    theLordOfTheRings: 'imgBook/The_Lord_Of_The_Rings.jpg',
    theHobbit: 'imgBook/The_Hobbit.jpg',
    theDavinciCode: 'imgBook/The_DaVinci_Code.jpg',
    oneHundredYearsOfSolitude: 'imgBook/One_Hundred_Years_Of_Solitude.jpg'
};

const article = document.querySelector("article");
let bookList = document.createElement("infoBookList");
for(const [key, value] of Object.entries(bookInfo)){
    let listItem = document.createElement("H3");
    listItem.innerHTML = `Title: ${bookInfo[key].title}<br>Language: ${bookInfo[key].language}<br>Author: ${bookInfo[key].author}<br><br>` +`<img src=${bookImages[key]} width="300" height="350"> `;
    bookList.append(listItem);
}

article.append(bookList);




