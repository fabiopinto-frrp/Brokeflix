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

fix anime , series, films models - with the object size array so when i add one ep it will update the ep size and add an episode and because its an object inside i can have title etc so each episode has a title too. (partially done -  make duplicated verification in addEpisode and need to make same changes on series then proceed to firebase stuff).


WHEN ALL IS WORKING:

- making the video player saving the value of the time 1 minute by 1 minute or 10 second by 10 second
  so when the user goes back to the ep it will continue where he stopped. to do this the value is going to be saved in the db

---

jwtAuth:
WHEN ALL IS WORKING:

- implement admin role - if the user is admin or user , if its admin it goes somewhere else than the user home page (LAST THING TO DO IN THE PROJECT)

---

Implement firebase storage to import images and videos and when the user uploads a video or image, it will be uploaded to firebase storage and the link will be saved in the database.
(after firebase, start the user Controller, and implement logic in front end)
---

Implement the user Controller :
it will have userList function that will have the animes films or series that the user has watched and the ones that he wants to watch.
| profile function that will have the user's profile information in the profile settings.
| updateProfile function that will update the user's profile information in the profile settings (avatar).
|
