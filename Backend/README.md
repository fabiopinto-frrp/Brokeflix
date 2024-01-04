git rules:

git checkout -b feat/added-react-frontend
git add .
commit - feat: Added Frontend with React and Vite"
push
git checkout main
aprovado merge
git pull

git remote add origin https://github.com/FreezZe-frrp/Brokeflix.git
git branch -M main
git push -u origin main

---

WHEN ALL IS WORKING:

- making the video player saving the value of the time 1 minute by 1 minute or 10 second by 10 second
  so when the user goes back to the ep it will continue where he stopped. to do this the value is going to be saved in the db

---

jwtAuth:
WHEN ALL IS WORKING:

- implement admin role - in the user model we have a isAdmin bollean property that is by default false

need to implement a function that if the property isAdmin is true to have access on the protected admin routes , so we have a middleware to verify user token i can get the info of the user in case the isAdmin and if its true to have access to those things
so in controller i can have a similiar verification but the user logged needs to have the isAdmin property true

then i put the series , films and animes routes on the front with the app.use(adminAuth0 behind) and behind this i will have the app.use(auth) and user routes.

---
