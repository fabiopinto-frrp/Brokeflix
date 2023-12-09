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

- implement admin role - if the user is admin or user , if its admin it goes somewhere else than the user home page (LAST THING TO DO IN THE PROJECT)

---

Implement firebase storage to import images and videos and when the user uploads a video or image, it will be uploaded to firebase storage and the link will be saved in the database.

---

Implement in the user Controller :
it will have userList function that will have the animes films or series that the user has watched and the ones that he wants to watch.

watchListController and routes incompleted , need testing and fixing maybe doing different routes for each thing (crud on watch list for each type and making on different api routes calls)
