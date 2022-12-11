/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./index.js":
/*!******************!*\
  !*** ./index.js ***!
  \******************/
/***/ (() => {

eval("// Import the functions you need from the SDKs you need\n/*\nimport { initializeApp } from \"firebase/app\";\nimport { getAuth } from \"firebase/auth\";\nimport { getDatabase } from 'firebase/database';\n\n//import { initializeApp } from \"https://www.gstatic.com/firebasejs/9.15.0/firebase-app.js\";\n//import { getAuth } from \"https://www.gstatic.com/firebasejs/9.15.0/firebase-auth.js\";\n//import { getDatabase } from \"https://www.gstatic.com/firebasejs/9.15.0/firebase-database.js\";\n\n// TODO: Add SDKs for Firebase products that you want to use\n// https://firebase.google.com/docs/web/setup#available-libraries\n\n// Your web app's Firebase configuration\n\nconst firebaseConfig = {\n  apiKey: \"AIzaSyCcG9GWTxksZuLOEL42RTFljUxRNaZnB2U\",\n  authDomain: \"language-llama.firebaseapp.com\",\n  databaseURL: \"https://language-llama-default-rtdb.europe-west1.firebasedatabase.app\",\n  projectId: \"language-llama\",\n  storageBucket: \"language-llama.appspot.com\",\n  messagingSenderId: \"776160674781\",\n  appId: \"1:776160674781:web:67c2a2b7015c1d262cec34\"\n};\n\n// Initialize Firebase\n//const app = initializeApp(firebaseConfig, 'language-llama');\nconst app = initializeApp(firebaseConfig);\nconst auth = getAuth(app);\nconst database = getDatabase(app);\n\nexport {app, auth, database};*///# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiLi9pbmRleC5qcy5qcyIsIm1hcHBpbmdzIjoiQUFBQTtBQUNBO0FBQ0EsU0FBUyxnQkFBZ0I7QUFDekIsU0FBUyxVQUFVO0FBQ25CLFNBQVMsY0FBYzs7QUFFdkIsV0FBVyxnQkFBZ0I7QUFDM0IsV0FBVyxVQUFVO0FBQ3JCLFdBQVcsY0FBYzs7QUFFekI7QUFDQTs7QUFFQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQSxRQUFRLHFCQUFxQiIsInNvdXJjZXMiOlsid2VicGFjazovL2xhbmd1YWdlLWxsYW1hLy4vaW5kZXguanM/NDFmNSJdLCJzb3VyY2VzQ29udGVudCI6WyIvLyBJbXBvcnQgdGhlIGZ1bmN0aW9ucyB5b3UgbmVlZCBmcm9tIHRoZSBTREtzIHlvdSBuZWVkXG4vKlxuaW1wb3J0IHsgaW5pdGlhbGl6ZUFwcCB9IGZyb20gXCJmaXJlYmFzZS9hcHBcIjtcbmltcG9ydCB7IGdldEF1dGggfSBmcm9tIFwiZmlyZWJhc2UvYXV0aFwiO1xuaW1wb3J0IHsgZ2V0RGF0YWJhc2UgfSBmcm9tICdmaXJlYmFzZS9kYXRhYmFzZSc7XG5cbi8vaW1wb3J0IHsgaW5pdGlhbGl6ZUFwcCB9IGZyb20gXCJodHRwczovL3d3dy5nc3RhdGljLmNvbS9maXJlYmFzZWpzLzkuMTUuMC9maXJlYmFzZS1hcHAuanNcIjtcbi8vaW1wb3J0IHsgZ2V0QXV0aCB9IGZyb20gXCJodHRwczovL3d3dy5nc3RhdGljLmNvbS9maXJlYmFzZWpzLzkuMTUuMC9maXJlYmFzZS1hdXRoLmpzXCI7XG4vL2ltcG9ydCB7IGdldERhdGFiYXNlIH0gZnJvbSBcImh0dHBzOi8vd3d3LmdzdGF0aWMuY29tL2ZpcmViYXNlanMvOS4xNS4wL2ZpcmViYXNlLWRhdGFiYXNlLmpzXCI7XG5cbi8vIFRPRE86IEFkZCBTREtzIGZvciBGaXJlYmFzZSBwcm9kdWN0cyB0aGF0IHlvdSB3YW50IHRvIHVzZVxuLy8gaHR0cHM6Ly9maXJlYmFzZS5nb29nbGUuY29tL2RvY3Mvd2ViL3NldHVwI2F2YWlsYWJsZS1saWJyYXJpZXNcblxuLy8gWW91ciB3ZWIgYXBwJ3MgRmlyZWJhc2UgY29uZmlndXJhdGlvblxuXG5jb25zdCBmaXJlYmFzZUNvbmZpZyA9IHtcbiAgYXBpS2V5OiBcIkFJemFTeUNjRzlHV1R4a3NadUxPRUw0MlJURmxqVXhSTmFabkIyVVwiLFxuICBhdXRoRG9tYWluOiBcImxhbmd1YWdlLWxsYW1hLmZpcmViYXNlYXBwLmNvbVwiLFxuICBkYXRhYmFzZVVSTDogXCJodHRwczovL2xhbmd1YWdlLWxsYW1hLWRlZmF1bHQtcnRkYi5ldXJvcGUtd2VzdDEuZmlyZWJhc2VkYXRhYmFzZS5hcHBcIixcbiAgcHJvamVjdElkOiBcImxhbmd1YWdlLWxsYW1hXCIsXG4gIHN0b3JhZ2VCdWNrZXQ6IFwibGFuZ3VhZ2UtbGxhbWEuYXBwc3BvdC5jb21cIixcbiAgbWVzc2FnaW5nU2VuZGVySWQ6IFwiNzc2MTYwNjc0NzgxXCIsXG4gIGFwcElkOiBcIjE6Nzc2MTYwNjc0NzgxOndlYjo2N2MyYTJiNzAxNWMxZDI2MmNlYzM0XCJcbn07XG5cbi8vIEluaXRpYWxpemUgRmlyZWJhc2Vcbi8vY29uc3QgYXBwID0gaW5pdGlhbGl6ZUFwcChmaXJlYmFzZUNvbmZpZywgJ2xhbmd1YWdlLWxsYW1hJyk7XG5jb25zdCBhcHAgPSBpbml0aWFsaXplQXBwKGZpcmViYXNlQ29uZmlnKTtcbmNvbnN0IGF1dGggPSBnZXRBdXRoKGFwcCk7XG5jb25zdCBkYXRhYmFzZSA9IGdldERhdGFiYXNlKGFwcCk7XG5cbmV4cG9ydCB7YXBwLCBhdXRoLCBkYXRhYmFzZX07Ki8iXSwibmFtZXMiOltdLCJzb3VyY2VSb290IjoiIn0=\n//# sourceURL=webpack-internal:///./index.js\n");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval-source-map devtool is used.
/******/ 	var __webpack_exports__ = {};
/******/ 	__webpack_modules__["./index.js"]();
/******/ 	
/******/ })()
;